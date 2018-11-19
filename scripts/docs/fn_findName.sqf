/*
	File: fn_findName.sqf
	Author: Danny
	
	Description:
	Config for faces
*/
private ["_firstnames", "_lastnames", "_forename","_surname","_name"];
_firstnames = ["Aatami", "Aatto", "Brandon", "Blaze", "Caleb", "Cameron", "Diego", "Dakota", "Elias", "Ezekiel", "Francais", "Fabian", "Gus", "Gil", "Harper", "Heath", "Isaac", "Ibrahim", "Jesus", "Josiah", "Khalil", "Noel", "Noah", "Owen", "Omar", "Oz", "Preston", "Paxton", "Attah", "Chukwumereije", "Fofana", "Iweala", "Osei", "Ezekwesili", "Keita", "Soyinka", "Toyin", "Solarin", "Gbadamosi", "Olanrewaju", "Magoro", "Madaki", "Jang", "Oyinlola", "Oyenusi", "Sow", "Onwudiwe", "Jakande", "Sane", "Igwe", "Sylla", "Obi", "Gueye", "Uba", "Kalu"];

_lastnames = ["Azikiwe", "Chahine", "Bello", "Cisse", "Akintola", "Okotie-Eboh", "Nzeogwu", "Onwuatuegwu", "Okafor", "Contee", "Okeke", "Conteh", "Okoye", "Diallo", "Obasanjo", "Babangida", "Buhari", "Dimka", "Toure", "Diya", "Toure", "Odili", "Ibori", "Igbinedion", "Alamieyeseigha", "Yar'Adua", "Asari-Dokubo", "Jalloh", "Anikulapo-Kuti", "Iwu", "Anenih", "Mensah", "Biobaku", "Tinibu", "Sesay", "Akinyemi", "Akiloye", "Adeyemi", "Adesida", "Omehia", "Sekibo", "Amaechi", "Bankole", "Nnamani", "Turay", "Okadigbo", "Yeboah", "Ojukwu", "Danjuma", "Effiong", "Akpabio"];

_forename = _firstnames select (floor (random (count _firstnames)));
_surname = _lastnames select (floor (random (count _lastnames)));
_name = [format ["%1 %2", _forename, _surname], _forename,_surname];
_name
