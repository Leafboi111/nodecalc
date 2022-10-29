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

clear

set a b operation;

while true
do
  tput setaf 13
  echo -e "Select operation type: + - * / or press enter to exit";
  read operation;
  if [ "$operation" == "" ];
  then
    exit
  fi
  tput setaf 1
  read -p "a=" a;
  read -p "b=" b;

  echo "$a $operation $b" | bc -l

done
