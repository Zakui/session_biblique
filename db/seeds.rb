# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create([
    {prenom: "user", nom: "user", email: "user@user.com", password: "123456", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 0, current_sign_in_at: nil, last_sign_in_at: nil, current_sign_in_ip: nil, last_sign_in_ip: nil, confirmation_token: nil, confirmed_at: "2019-05-29 13:30:03", confirmation_sent_at: nil, unconfirmed_email: nil},
    {prenom: "test", nom: "test", email: "test@test.com", password: "123456", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 0, current_sign_in_at: nil, last_sign_in_at: nil, current_sign_in_ip: nil, last_sign_in_ip: nil, confirmation_token: nil, confirmed_at: "2019-05-29 13:30:03", confirmation_sent_at: nil, unconfirmed_email: nil},
])

Paroise.create([
    {nom: "Cathedrale Sainte Marie", abbreger: "Cathedrale"},
    {nom: "Saint Joseph Ouvrier", abbreger: "St Joseph"},
    {nom: "Saint Michel de coleyah", abbreger: "St Michel"},
    {nom: "Saint Pierre et Paul de Bonfi", abbreger: "St Pierre et Paul"},
    {nom: "Saint André de Hafia", abbreger: "St André"},
    {nom: "Notre Dame des Monts de Hamdalaye", abbreger: "Notre Dame des Monts"},
    {nom: "Saint Etienne de Yimbaya", abbreger: "St Etienne"},
    {nom: "Saint Cyprien de Dixin", abbreger: "St Cyprien"},
    {nom: "Saint Augustin de Taouyah", abbreger: "St Augustin"},
    {nom: "Anne Marie Javouhey de Nongo", abbreger: "Anne Marie Javouhey"},
    {nom: "Saint Jeaques de Lambandji", abbreger: "St Jeaques"},
    {nom: "Sainte Odile de simbaya", abbreger: "Ste Odile"},
    {nom: "Saint Robert Bellarmin de koloma", abbreger: "St Robert Bellarmin"},
    {nom: "Saint Charle Lwanga de Sonfonia", abbreger: "St Charle Lwanga"},
    {nom: "Saint Benoit d'Enta Nord", abbreger: "St Benoit"},
    {nom: "Sainte Thérèse d'Enta", abbreger: "Ste Therese Enta"},
    {nom: "Sainte Rita de Sangoyah", abbreger: "Ste Rita"},
    {nom: "Saint Jean l'Evengeliste de Dabompa", abbreger: "St Jean de Dabompa"},
    {nom: "Saint Mathieu de Kountiyah", abbreger: "St Mathieu"},
    {nom: "Saint Kizito de KM-36", abbreger: "St Kizito"},
    {nom: "Sainte Thérèse de Dubréka", abbreger: "Ste Thérèse Dubréka"},
    {nom: "Saint Odile de Coyah", abbreger: "Ste Odile de Coyah"},
    {nom: "Saint Raymond de Forécaria", abbreger: "St Raymond"},
    {nom: "Sainte Croix de Kindia", abbreger: "Ste Croix"},
    {nom: "Christ-Roi de Fria", abbreger: "Christ-Roi de Fria"},
])

Batiment.create([
    {nom: "Batiment 1", abbreger: "B1"},
    {nom: "Batiment 2", abbreger: "B2"},
    {nom: "Batiment 3", abbreger: "B3"},
    {nom: "Batiment 4", abbreger: "B4"},
    {nom: "Batiment 5", abbreger: "B5"},
    {nom: "Batiment 6", abbreger: "B6"},
    {nom: "Batiment 7", abbreger: "B7"},
    {nom: "Batiment 8", abbreger: "B8"},
    {nom: "Vatican", abbreger: "Vatican"},
    {nom: "Saint Jean Paul II", abbreger: "St Jean Paul II"},
])

Dortoir.create([
    {nom: "Chambre 1", abbreger: 'Ch1', capacite: 4, place_disponible: 4, batiment_id: 1, ocupant: 'Coordination'},
    {nom: "Chambre 2", abbreger: 'Ch2', capacite: 4, place_disponible: 4, batiment_id: 1, ocupant: 'Coordination'},
    {nom: "Chambre 3", abbreger: 'Ch3', capacite: 4, place_disponible: 4, batiment_id: 1, ocupant: 'Coordination'},
    {nom: "Chambre 4", abbreger: 'Ch4', capacite: 4, place_disponible: 4, batiment_id: 1, ocupant: 'Coordination'},
    {nom: "Salle 1", abbreger: 'Salle 1', capacite: 15, place_disponible: 15, batiment_id: 2, ocupant: 'Filles'},
    {nom: "Salle 2", abbreger: 'Salle 2', capacite: 15, place_disponible: 15, batiment_id: 2, ocupant: 'Filles'},
    {nom: "Chambre 1", abbreger: 'Ch1', capacite: 4, place_disponible: 4, batiment_id: 3, ocupant: 'Filles'},
    {nom: "Chambre 2", abbreger: 'Ch2', capacite: 4, place_disponible: 4, batiment_id: 3, ocupant: 'Filles'},
    {nom: "Chambre 3", abbreger: 'Ch3', capacite: 4, place_disponible: 4, batiment_id: 3, ocupant: 'Filles'},
    {nom: "Chambre 4", abbreger: 'Ch4', capacite: 4, place_disponible: 4, batiment_id: 3, ocupant: 'Filles'},
    {nom: "Chambre 1 Salle 1", abbreger: 'Ch1 Salle 1', capacite: 10, place_disponible: 10, batiment_id: 4, ocupant: 'Filles'},
    {nom: "Chambre 1 Salle 2", abbreger: 'Ch1 Salle 2', capacite: 10, place_disponible: 10, batiment_id: 4, ocupant: 'Filles'},
    {nom: "Chambre 1 Salle 3", abbreger: 'Ch1 Salle 3', capacite: 10, place_disponible: 10, batiment_id: 4, ocupant: 'Filles'},
    {nom: "Chambre 2", abbreger: 'Ch2', capacite: 2, place_disponible: 2, batiment_id: 4, ocupant: 'Coordination'},
    {nom: "Chambre 3", abbreger: 'Ch3', capacite: 4, place_disponible: 4, batiment_id: 4, ocupant: 'Coordination'},
    {nom: "Chambre 4", abbreger: 'Ch4', capacite: 2, place_disponible: 2, batiment_id: 4, ocupant: 'Coordination'},
    {nom: "Chambre 1", abbreger: 'Ch1', capacite: 4, place_disponible: 4, batiment_id: 5, ocupant: 'Infirmerie'},
    {nom: "Chambre 2", abbreger: 'Ch2', capacite: 8, place_disponible: 8, batiment_id: 5, ocupant: 'Filles'},
    {nom: "Chambre 1", abbreger: 'Ch1', capacite: 18, place_disponible: 18, batiment_id: 6, ocupant: 'Filles'},
    {nom: "Chambre 2", abbreger: 'Ch2', capacite: 18, place_disponible: 18, batiment_id: 6, ocupant: 'Filles'},
    {nom: "Chambre 1", abbreger: 'Ch1', capacite: 3, place_disponible: 3, batiment_id: 7, ocupant: 'Filles'},
    {nom: "Chambre 2", abbreger: 'Ch2', capacite: 3, place_disponible: 3, batiment_id: 7, ocupant: 'Filles'},
    {nom: "Chambre 3", abbreger: 'Ch3', capacite: 3, place_disponible: 3, batiment_id: 7, ocupant: 'Filles'},
    {nom: "Chambre 4", abbreger: 'Ch4', capacite: 3, place_disponible: 3, batiment_id: 7, ocupant: 'Filles'},
    {nom: "Dortoir 1", abbreger: 'Ch1', capacite: 40, place_disponible: 40, batiment_id: 8, ocupant: 'Filles'},
    {nom: "I", abbreger: 'I', capacite: 80, place_disponible: 80, batiment_id: 9, ocupant: 'Garçons'},
    {nom: "II", abbreger: 'II', capacite: 80, place_disponible: 80, batiment_id: 9, ocupant: 'Garçons'},
    {nom: "", abbreger: '', capacite: 50, place_disponible: 50, batiment_id: 10, ocupant: 'Garçons'},
])
