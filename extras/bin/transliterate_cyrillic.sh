#!/usr/bin/env bash
# Based on http://linux-bash.ru/mtext/98-translit.html

shopt -s nullglob
for NAME in * ; do
  TRS=`echo $NAME | sed "y/абвгдезийклмнопрстуфыіґ/abvhdezyjklmnoprstufyig/"`
  TRS=`echo $TRS | sed "y/АБВГДЕЗИЙКЛМНОПРСТУФЫІҐ/ABVHDEZYJKLMNOPRSTUFYIG/"`
  TRS=${TRS//Ч/CH} TRS=${TRS//ч/ch};
  TRS=${TRS//Ш/SH} TRS=${TRS//ш/sh};
  TRS=${TRS//Ё/JO} TRS=${TRS//ё/jo};
  TRS=${TRS//Ж/ZH} TRS=${TRS//ж/zh};
  TRS=${TRS//Щ/SHCH} TRS=${TRS//щ/shch};
  TRS=${TRS//Э/JE} TRS=${TRS//э/je};
  TRS=${TRS//Ю/IU} TRS=${TRS//ю/iu};
  TRS=${TRS//Я/IA} TRS=${TRS//я/ia};
  TRS=${TRS//ъ/} TRS=${TRS//ъ/};
  TRS=${TRS//Ь/} TRS=${TRS//ь/}
  TRS=${TRS//Ї/YI} TRS=${TRS//ї/yi};
  TRS=${TRS//Ц/TS} TRS=${TRS//ц/ts};
  TRS=${TRS//Х/KH} TRS=${TRS//х/kh};
  TRS=${TRS//Є/IE} TRS=${TRS//є/ie};

  if [ "$NAME" != "$TRS" ]; then
    mv -v "$NAME" "$TRS"
  fi

  if [[ `file -b "$TRS"` == directory ]]; then
    cd "$TRS"
    "$0"
    cd ..
  fi
done
