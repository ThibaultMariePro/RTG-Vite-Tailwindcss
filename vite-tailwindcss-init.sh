### Variables
BLUE='\033[34m'; 
PURPLE='\e[35m';
GREEN='\e[92m';
RED='\e[31m';
BOLD='\033[1m';
ENDTAG='\033[0m';

printf '%b\n'       " ╔═══════════════════════════╗";
printf '%b\n'       " ║   Vite 7 - Tailwindcss 4  ║";
printf '%b\n'       " ╚═══════════════════════════╝";
printf '%b\n\b'     "$PURPLE This tool will create a clean vanilla boilerplate \n Vite 7.x.x + Tailwindcss 4.x.x project. $ENDTAG";
printf '%b\n'       "\nProject name [my-project]:"

read INPUT
if [ $INPUT ] 
then 
    INPUT=$INPUT
else 
    INPUT="my-project"
fi
printf '%b\n\b\n'     "\n$PURPLE Setting up Vite project $INPUT $ENDTAG";

printf '%b\n\b'         "   - Creating directory.."

if [ -d "$INPUT" ]; then
  printf '%b\n\b'         "$RED ═════════ ERROR ═════════"
  printf '%b\n\b'         " $INPUT already exists!"
  printf '%b\n\b'         " Please rename your project or remove the old one."
  printf '%b\n\b'         " ════ ABORTING SCRIPT ════$ENDTAG"
  exit 1
fi

mkdir $INPUT
printf '%b\n\b'         "   - Creating Vite project.."
npm create vite@latest $INPUT -- --template vanilla --prefix ./$INPUT > /dev/null 2>&1

printf '%b\n\b'         "   - Installing Tailwindcss.."

npm install tailwindcss @tailwindcss/vite --prefix $INPUT/ > /dev/null 2>&1

printf '%b\n\b\n'     "$PURPLE Cleaning project from demo files.. $ENDTAG";
printf '%b\n\b'         "   -Removing unecessary files.."
rm $INPUT/public/vite.svg
rm $INPUT/src/counter.js
rm $INPUT/src/javascript.svg

printf '%b\n\b'         "   -Cleaning style.css and main.js.."
echo "@import \"tailwindcss\";" > $INPUT/src/style.css
echo "import './style.css'" > $INPUT/src/main.js

printf '%b\n\b'         "   -Creating Vite config file.."
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
printf '%b\n\b'     "$PURPLE Everything should work, \n$BLUE cd$ENDTAG in $INPUT/ and run$BLUE$BOLD npm run dev $ENDTAG\n";

exit 0