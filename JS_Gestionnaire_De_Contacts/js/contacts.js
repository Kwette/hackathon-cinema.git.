/*
Activité : gestion des contacts
*/

// TODO : complétez le programme
class Contact {
  constructor(name, firstName) {
    this.name = name;
    this.firstName = firstName;
  }
  // Renvoie la description du contact
  decrire() {
    return `Prénom : ${this.name}, Nom : ${this.firstName}`;
  }
}

let contactArray = [];
const carole = contactArray.push(new Contact("Carole", "Lévisse").decrire());
const melodie = contactArray.push(new Contact("Mélodie", "Nelsonne").decrire());

let choice = 1
while (choice !== 0) {
  console.log("Bienvenue dans le gestionnaire de contact");
  console.log("1 : Lister les contacts");
  console.log("2 : Ajouter un contact");
  console.log("0 : Quitter");

  let choice = Number(prompt("Choisissez une option"));

  if (choice === 1) {
    console.log("Voici la liste de tous les contacts");
    contactArray.forEach(function(contact) {
      console.log(contact);
    });
  } else if (choice === 2) {
      name = prompt("Entrer le prénom");
      firstName = prompt("Entrer le nom");
      contactArray.push(new Contact(`${this.name}`, `${this.firstName}`).decrire());
      console.log(`Un nouveau contact à été ajouté : "${this.name} ${this.firstName}"`);
  } else {
      break;
  }

}
