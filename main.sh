# nodecalc
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

function std {

  set a b operation;
  tput setaf 13
  echo -e "Select operation type: + - * / ^ or press enter to exit";
  read operation;
  if [ "$operation" == "" ];
  then
    exit
  fi
  tput setaf 1
  read -p "a=" a;
  read -p "b=" b;

  echo "$a $operation $b" | bc -l

}

function quad {

  set A B C;

  while true
  do

    tput setaf 226
    read -p "a=" A;
    read -p "b=" B;
    read -p "c=" C;

    if [ $A == "1" ];
    then
      a2=""
    fi

    if [ $A == 0 ]; then
        echo "$(tput setaf 7)Not a quadratic equation.";
        break
    fi

    tput setaf 226
    echo -n "The equation is $A"
    echo -n "x^2 + $B"
    echo "x + $C"

    D=$(( ($B)*($B)-4*($A)*($C) ));
    #integer math only!
    if [ $D == 0 ]; then
        echo -n "x = "
        echo -e "scale=3\n-0.5*($B)/($A)" | bc
        break
    fi

    if [ $D -lt 0 ]; then
        echo "Imaginary Solution.";
        break
    fi

    echo $D
    if [ $D -gt 0 ]; then
        echo -n "x1 = "
        echo -e "scale=3\n0.5*(-($B)+sqrt($D))/($A)" | bc
        echo -n "x2 = "
        echo -e "scale=3\n0.5*(-($B)-sqrt($D))/($A)" | bc
    else
        echo -n "x1 = ("
        echo -e "scale=3\n-0.5*($B)/($A)" | bc
        echo -n ", "
        echo -e "scale=3\n0.5*sqrt(-($D))/($A)" | bc
        echo ")"
        echo -n "x2 = ("
        echo -e "scale=3\n-0.5*($B)/($A)" | bc
        echo -n ", "
        echo -e "scale=3\n-0.5*sqrt(-($D))/($A)" | bc
        echo ")"
    fi

    break

  done

}

while true;
do

clear
tput setaf 7
echo "Welcome to nodecalc, a simple calculator."; echo

read -p "$(tput setaf 213)Standard or Quadratic? (s/q) " sq

case $sq in
	[sS] ) std;;
		#break;;
	[qQ] ) quad;;
		#break;;
	* ) break
esac

read -p "$(tput setaf 213)Press enter to quit: " petq

done
