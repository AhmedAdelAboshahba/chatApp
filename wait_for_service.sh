HOST="$1"
PORT="$2"


while ! nc $HOST $PORT; do
  printf "$2 still sleeping\n"
  sleep 1
done