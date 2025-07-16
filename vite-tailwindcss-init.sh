#!/bin/bash

# Variables
BLUE='\033[34m'; 
PURPLE='\e[35m';
GREEN='\e[92m';
RED='\e[31m';
BOLD='\033[1m';
ENDTAG='\033[0m';

printf '%b\n'       " ╔═══════════════════════════════╗";
printf '%b\n'       " ║   Vite vanilla - Tailwindcss  ║";
printf '%b\n'       " ╚═══════════════════════════════╝";
printf '%b\n\b'     "$PURPLE$BOLD This tool will create a clean vanilla boilerplate \n Vite 7.x.x + Tailwindcss 4.x.x project. $ENDTAG";
printf '%b'         "\n Project name [my-project]: "

read INPUT
if [ $INPUT ] 
then 
    if [[ "$INPUT" =~ ^[a-z0-9.-_]+$ ]]; then
      INPUT=$INPUT
    else
      printf '%b\n\b'         "$RED$BOLD ═════════ ERROR ═════════$ENDTAG"
      printf '%b\n\b'         "$RED Invalid input!\n Only lowercase letters, digits, - and . allowed.$ENDTAG"
      printf '%b\n\b'         "$RED$BOLD ════ ABORTING SCRIPT ════$ENDTAG"
      #TODO loop
      exit 1
    fi
else 
    INPUT="my-project"
fi

printf '%b\n\b'     "\n$PURPLE$BOLD Setting up Vite project: $INPUT $ENDTAG";

printf '%b\n'         "   - Creating directory.."

if [ -d "$INPUT" ]; then
  printf '%b\n\b'         "$RED$BOLD ═════════ ERROR ═════════$ENDTAG"
  printf '%b\n\b'         "$RED $INPUT already exists!\n Please rename your project or remove the old one.$ENDTAG"
  printf '%b\n\b'         "$RED$BOLD ════ ABORTING SCRIPT ════$ENDTAG"
  exit 1
fi

mkdir $INPUT
printf '%b\n\b'         "   - Creating Vite project.."
npm create vite@latest $INPUT -- --template vanilla --prefix ./$INPUT > /dev/null 2>&1

printf '%b\n\b'         "   - Installing Tailwindcss.."

npm install tailwindcss @tailwindcss/vite --prefix $INPUT/ > /dev/null 2>&1

printf '%b\n\b'     "$PURPLE$BOLD Cleaning project from demo files.. $ENDTAG";
printf '%b\n\b'         "   - Removing unecessary files.."
rm $INPUT/public/vite.svg
rm $INPUT/src/counter.js
rm $INPUT/src/javascript.svg

printf '%b\n\b'         "   - Cleaning style.css.."
echo "@import \"tailwindcss\";" > $INPUT/src/style.css
printf '%b\n\b'         "   - Cleaning main.js.."
echo "import './style.css'" > $INPUT/src/main.js
printf '%b\n\b'         "   - Cleaning index.html.."
printf '%b' "<!doctype html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Vite App</title>
  </head>
  <body>
    <div id="app"></div>
    <script type="module" src="/src/main.js"></script>
  </body>
</html>
" > $INPUT/index.html

printf '%b\n\b'         "   - Creating Vite config file.."
touch $INPUT/vite.config.js

printf '%b' "import { defineConfig } from 'vite'
import tailwindcss from '@tailwindcss/vite'

export default defineConfig({
  plugins: [
    tailwindcss({
      content: ['./index.html', './src/**/*.{js,ts,jsx,tsx,html}'],
    }),
  ],
}) " > $INPUT/vite.config.js


printf '%b\n\b'     "$GREEN$BOLD ═══════════ SUCCESS! ═══════════ $ENDTAG";
printf '%b\n\b'     " Everything should work, \n Now you can$BLUE$BOLD cd$ENDTAG in $BLUE$BOLD$INPUT/$ENDTAG and run$BLUE$BOLD npm run dev $ENDTAG";
printf '%b\n\b'     "$GREEN$BOLD ═══════════════════════════════ $ENDTAG";

printf '%b'         "$PURPLE$BOLD Do you want to delete this script? (y/N):$ENDTAG ";
read DELETE

case $DELETE in
  y|Y|yes|YES )
    printf '%b\n\b' " Kaboom!"
    printf '%b\n\b' " deleting $BLUE$BOLD$0$ENDTAG.."
    rm $0
    printf '%b\n\b'     "$GREEN$BOLD ═══════════ SUCCESS! ═══════════ $ENDTAG";
    printf '%b\n\b'     " Script deleted!"
    printf '%b\n\b'     "$GREEN$BOLD ═══════════════════════════════ $ENDTAG";
  ;;
  * )
    printf '%b\n\b' " Ok, we leave it there then."
  ;;
esac

exit 0