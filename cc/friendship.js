const employees = [
  "1,Richard,Engineering",
  "2,Kebebah,HR",
  "3,Tommy,Business",
  "4,Betty,Engineering",
  "6,Carla,Engineering",
  "9,Nixon,Director"
];

const friendshipsInput = [
  "1,2",
  "1,3",
  "1,6",
  "2,4"
];

const allFriends = (employees, connections) => {
  let ids = idFinder(employees);
  let network = addFriend(ids, connections);
  console.log('====================================');
  console.log(network);
  console.log('====================================');
};

const idFinder = (employees) => {
  let ids = {};

  for (let index = 0; index < employees.length; index++) {
    let employee = employees[index];
    ids[employee.split(',')[0]] = [];
  }
  return ids;
};

const addFriend = (ids, connections) => {
  for (let index = 0; index < connections.length; index++) {
    let pair = connections[index].split(',');
    addFriendHelper(ids, pair);
  }
  return ids;
};

const addFriendHelper = (ids, pair) => {
  let friend1 = pair[0];
  let friend2 = pair[1];

  ids[friend1].push(friend2);
  ids[friend2].push(friend1);
};

allFriends(employees, friendshipsInput);
