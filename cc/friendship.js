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
    relationships[employee.split(',')[0]] = {friends: [], dpt: employee.split(',')[2]};
  });

  friendshipsInput.forEach(pair => {
    pair = pair.split(',');
    relationships[pair[0]].friends.push(pair[1]);
    relationships[pair[1]].friends.push(pair[0]);
  });
  return relationships;
};

const employeeRelations = (employees, friendshipsInput) => {
  let network = allFriends(employees, friendshipsInput);
  let relations = {};

  Object.keys(network).forEach(id => {
    let employee = network[id];

    relations[employee.dpt] ? relations[employee.dpt].employeeCount++ : relations[employee.dpt] = {employeeCount:1, otherDptFd: 0}; 

    for (let index = 0; index < employee.friends.length; index++) {
      const friendId = employee.friends[index];
      if (network[friendId].dpt === network[id].dpt) {
        relations[employee.dpt].otherDptFd++;
        break;
      }
    }
  });
  console.log('====================================');
  console.log(relations);
  console.log('====================================');
};

employeeRelations(employees, friendshipsInput);