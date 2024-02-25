members = [
  { first_name: "Brandon", last_name: "Valle", birthday: "12/04/1992", active: true, enabled_to_pay: true },
  { first_name: "Herlan", last_name: "Añez", birthday: "01/01/1990", active: true, enabled_to_pay: true },
  { first_name: "Rolf", last_name: "Llampa", birthday: "01/01/1990", active: true, enabled_to_pay: true },
  { first_name: "Aaron", last_name: "Añez", birthday: "01/01/1990", active: true, enabled_to_pay: true },
  { first_name: "Agustin", last_name: "Montaño", birthday: "01/01/1990", active: true, enabled_to_pay: true },
  { first_name: "Alicia", last_name: "Jimenez", birthday: "01/01/1990", active: false, enabled_to_pay: false },
  { first_name: "Carlos", last_name: "Aguilar", birthday: "01/01/1990", active: true, enabled_to_pay: true },
  { first_name: "Esther", last_name: "Cruz", birthday: "01/01/1990", active: true, enabled_to_pay: true },
  { first_name: "Graciela", last_name: "Rojas", birthday: "01/01/1990", active: true, enabled_to_pay: true },
  { first_name: "Laida", last_name: "Vaca", birthday: "01/01/1990", active: true, enabled_to_pay: false },
  { first_name: "Johan", last_name: "Nava", birthday: "01/01/1990", active: true, enabled_to_pay: true },
  { first_name: "José Luis", last_name: "Diaz", birthday: "01/01/1990", active: true, enabled_to_pay: true },
  { first_name: "Mariel", last_name: "Villagram", birthday: "01/01/1990", active: true, enabled_to_pay: true },
  { first_name: "Mauricio", last_name: "Añez", birthday: "01/01/1990", active: true, enabled_to_pay: true },
  { first_name: "Alexander", last_name: "Añez", birthday: "01/01/1990", active: true, enabled_to_pay: false },
  { first_name: "Victor", last_name: "Soria", birthday: "01/01/1990", active: true, enabled_to_pay: false },
]

members.each do |member|
  Member.find_or_create_by!(member)
end

FeeType.find_or_create_by!(name: "Llegada tarde", amount: 10.00)
FeeType.find_or_create_by!(name: "Falta", amount: 10.00)