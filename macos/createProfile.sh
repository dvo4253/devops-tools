APPLICATIONS_DIR="/Applications/scripts"

mkdir -p ${APPLICATIONS_DIR}

cp checkSHA.sh ${APPLICATIONS_DIR}/checkSHA.sh
chmod 740 ${APPLICATIONS_DIR}/checkSHA.sh

echo "alias checkSHA=\"${APPLICATIONS_DIR}/checkSHA.sh\"" > ~/.bash_profile_scripts
