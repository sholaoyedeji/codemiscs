 /*
 _________________________________________________________________________
/\                                                                        \
\_|       ___        __                            _   _                  |
  |      |_ _|_ __  / _| ___  _ __ _ __ ___   __ _| |_(_) ___  _ __       |
  |       | || '_ \| |_ / _ \| '__| '_ ` _ \ / _` | __| |/ _ \| '_ \      |
  |       | || | | |  _| (_) | |  | | | | | | (_| | |_| | (_) | | | |     |
  |      |___|_| |_|_|  \___/|_|  |_| |_| |_|\__,_|\__|_|\___/|_| |_|     |
  |                                                                       |
  |             tw (Translate Word): Human Language Translator            |
  |           Copyright (C) 2007 - 2014 Juan Manuel Borges Caño           |
  |                  The need for an smart, fast and rich                 |
  |               translation answer inspired this command.               |
  |               Based on the Mythes OpenOffice Project Demo             |
  |        The reason this project is not currently arch independent.     |
  |                    _     _                                            |
  |                   | |   (_) ___ ___ _ __  ___  ___                    |
  |                   | |   | |/ __/ _ \ '_ \/ __|/ _ \                   |
  |                   | |___| | (_|  __/ | | \__ \  __/                   |
  |                   |_____|_|\___\___|_| |_|___/\___|                   |
  |                                                                       |
  |  This program is free software: you can redistribute it and/or modify |
  |  it under the terms of the GNU General Public License as published by |
  |   the Free Software Foundation, either version 3 of the License, or   |
  |                  (at your option) any later version.                  |
  |                                                                       |
  |    This program is distributed in the hope that it will be useful,    |
  |     but WITHOUT ANY WARRANTY; without even the implied warranty of    |
  |     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the     |
  |              GNU General Public License for more details.             |
  |                                                                       |
  |   You should have received a copy of the GNU General Public License   |
  | along with this program.  If not, see <http://www.gnu.org/licenses/>. |
  |   ____________________________________________________________________|_
   \_/______________________________________________________________________/
*/

#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include <hunspell/hunspell.hxx>
#include <mythes.hxx>
using namespace std;
extern char * mystrdup(const char * s);

void myfreelist(char *** list, int n)
{
	if (list && (n > 0)) {
		for (int i = 0; i < n; i++) if ((*list)[i]) free((*list)[i]);
		free(*list);
		*list = NULL;
	}
}

int main(int argc, char** argv)
{
	FILE* wtclst;

	/* first parse the command line options: * arg1 - index file, arg2 thesaurus data file, arg3 - file of words to check, arg4, arg5 - opt. Hunspell affix and dic file for stemming and morphological generation */
	if (argc < 3) {
		fprintf(stderr,"correct syntax is:\n"); 
		fprintf(stderr,"example index_file thesaurus_file file_of_words_to_check [affix_file dic_file]\n");
		exit(1);
	}

	/* open the words to check list */
	wtclst = fopen(argv[3], "r");
	if (!wtclst) {
		fprintf(stderr,"Error - could not open file of words to check\n");
		exit(1);
	}

	// Hunspell for stemming and morphological generation of affixes synonyms
	Hunspell * pH = NULL;		
	if (argc >= 5) pH = new Hunspell(argv[4], argv[5], (const char *) NULL);

	// open a new thesaurus object
	MyThes * pMT = new MyThes(argv[1], argv[2]);

	// get the encoding used for the thesaurus data
	char * encoding = pMT->get_th_encoding();
//	printf("Thesaurus uses encoding %s\n\n", encoding);
	printf("%s\n", encoding);
		
	int k;
	char buf[101];
	char oldbuf[101];
	mentry * pmean;

	while(fgets(buf,100,wtclst)) {
		oldbuf[0] = '\0';
		k = strlen(buf);
		*(buf + k - 1) = '\0';
		int len = strlen(buf);
		int count = pMT->Lookup(buf,len,&pmean);
		// don't change value of pmean
		// or count since needed for CleanUpAfterLookup routine
		if (!count) {
			int stemcount = 0;
			char **stem;
			if (pH) stemcount = pH->stem(&stem, buf); else stemcount = 0;
			if (stemcount) {
//				printf("stem: %s\n", stem[0]);
				strcpy(oldbuf,buf);
				strncpy(buf, stem[0], sizeof(buf)-1);
				buf[sizeof(buf)-1] = 0;
				len = strlen(buf);
				count = pMT->Lookup(buf, len, &pmean);
				myfreelist(&stem, stemcount);
			} else oldbuf[0] = '\0';
		}

		mentry* pm = pmean;
		if (count) {
//			printf("%s has %d meanings\n",buf,count);
			for (int i=0; i < count; i++) {
//				printf("	 meaning %d: %s\n",i,pm->defn);
				for (int j=0; j < pm->count; j++) {
					char ** gen;
					int l = 0;
					if (pH && oldbuf[0]) l = pH->generate(&gen, pm->psyns[j], oldbuf);
					if (l) {
						int k;
//						printf("			 %s",gen[0]);
						printf("%s",gen[0]);
						for (k = 1; k < l; k++) printf(", %s",gen[k]);
						printf("\n");
						myfreelist(&gen, l);
//					} else printf("			 %s\n",pm->psyns[j]);
					} else printf("%s\n",pm->psyns[j]);
				}
//				printf("\n");
				pm++;
			}
//			printf("\n\n");
			// now clean up all allocated memory 
			pMT->CleanUpAfterLookup(&pmean,count);
//		} else {
//			printf("\"%s\" is not in thesaurus!\n",buf);
		}
	}

	fclose(wtclst);
	delete pMT;
	if (pH) delete pH;
	return 0;
}
