const employees = [
  "1,Richard,Engineering",
  "2,Rebekah,HR",
  "3,Tommy,Business",
  "4,Betty,Engineering",
  "6,David,Engineering",
  "9,Nixon,Director"
];

const friendshipsInput = [
  "1,2",
  "1,3",
  "1,6",
  "2,4"
];

const allFriends = (employees, friendshipsInput) => {
  let relationships = {};

  employees.forEach(employee => {
    relationships[employee.split(',')[0]] = {friends: [], dpt: employee.split(',')[2], otherDptFd: false};
  });
  console.log('====================================');
  console.log(relationships);
  console.log('====================================');
  
};



let network = allFriends(employees, friendshipsInput);

