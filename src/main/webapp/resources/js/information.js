

if("${isValidAdressUpdate}"){
    document.getElementById("adreslerimbuttonu").click();
}

function  adresslerimFunction(){

    document.getElementById("form3").classList.add("hidden");
    document.getElementById("Adreslerimburada").classList.remove("hidden");
    document.getElementById("adreslerimbuttonu").classList.add("hidden");
    document.getElementById("addressAddButtonu").classList.remove("hidden");

    $.ajax({
        type:"GET",
        url:"/apparel/user/updateAdressControlgetAdress",
        contentType:"charset=utf-8",
        //  data:"id="+2,
        success: function (data){
            console.log(JSON.parse(data));
            console.log(data);
            let dat=JSON.parse(data);

            document.getElementById("Adreslerimburada").innerHTML="";
            for (let i=0;i<dat.length;i++){
                console.log("dataaaaa :::::"+dat[i]);
                let idim= 'singleAddress'+dat[i].id.toString();
                document.getElementById("Adreslerimburada").innerHTML+=
                    "<div id="+idim+" class='adressesStyle'>"+
                    "<div>" +"<span style='float: left;margin-top: 5px' class='adressesStyleTitle'>"+dat[i].title_address+"</span>"+
                    "<button type='button' class='btn btn-danger adressesStyleButtonEdit' onclick='singleAdresEditFunction("+JSON.stringify(dat[i])+")'>"+'düzenle'+"</button>"+
                    "<button type='button' class='btn btn-danger adressesStyleButtonDelete' onclick='singleAdresDeleteFunction("+dat[i].id+")'>"+'sil'+"</button>"+
                    "</div>"+
                    "<div class='adressesStyleBody'> "+
                    dat[i].name+" "+dat[i].surname+"<br>"+
                    dat[i].addressline+","+dat[i].district+","+dat[i].city+","+dat[i].country+"</div>"
                    + "</div>";
            }

        },
        error:function (error){
            console.log(error)
        }
    })

}


function singleAdresEditFunction(datas){

    document.getElementById("form4Update").classList.remove("hidden");

    let citim=plakasearchCity(datas.city);

    document.getElementById("form4UpdateaddressId").value=datas.id;
    document.getElementById("form4UpdateaddressTitle").value=datas.title_address;
    document.getElementById("form4UpdateName").value=datas.name;
    document.getElementById("form4UpdateSurname").value=datas.surname;
    document.getElementById("form4UpdateaddressLine").value=datas.addressline;
    document.getElementById("form4UpdateCitySelect").value=citim;
    document.getElementById("form4UpdateCitySelect").innerText=datas.city;
    document.getElementById("form4UpdateDistrictSelect").value=datas.district;
    document.getElementById("form4UpdateDistrictSelect").innerText=datas.district;
    document.getElementById("form4UpdateCountry").value=datas.country;
    document.getElementById("form4UpdatePostcode").value=datas.postcode;
}


function singleAdresDeleteFunction(id){


    console.log("silinecek olanın idisi=== "+id+" ===");
    $.ajax({
        type:"GET",
        url:"/apparel/user/updateAdressControlDeleteAdress",
        data:"id="+id.toString(),
        success: function (data){
        },
        error:function (error){
            console.log(error)
        }
    })

    let adiName='singleAddress'+id.toString();
    document.getElementById(adiName).classList.add("hidden");

    adresslerimFunction();
}


// function deleteFunction(){
//     let id=5;
//     $.ajax({
//         type:"GET",
//         url:"/apparel/user/updateAdressControlgetAdress",
//          data:"id="+id,
//         success: function (data){
//         },
//         error:function (error){
//             console.log(error)
//         }
//     })
// }





function validateFunctionP() {

    document.getElementById("password_script").classList.add("bgAndtextcolor");
    document.getElementById("information_script").classList.remove("bgAndtextcolor");
    document.getElementById("address_script").classList.remove("bgAndtextcolor");

    document.getElementById("form1").classList.add("hidden");
    document.getElementById("form3").classList.add("hidden");
    document.getElementById("form2").classList.remove("hidden");

    document.getElementById("adreslerimbuttonu").classList.add("hidden");

    document.getElementById("Adreslerimburada").classList.add("hidden");
    document.getElementById("form4Update").classList.add("hidden");

    document.getElementById("addressAddButtonu").classList.add("hidden");

}
function validateFunctionI() {
    document.getElementById("information_script").classList.add("bgAndtextcolor");
    document.getElementById("password_script").classList.remove("bgAndtextcolor");
    document.getElementById("address_script").classList.remove("bgAndtextcolor");

    document.getElementById("form2").classList.add("hidden");
    document.getElementById("form3").classList.add("hidden");
    document.getElementById("form1").classList.remove("hidden");

    document.getElementById("adreslerimbuttonu").classList.add("hidden");


    document.getElementById("Adreslerimburada").classList.add("hidden");
    document.getElementById("form4Update").classList.add("hidden");

    document.getElementById("addressAddButtonu").classList.add("hidden");

}

function validateFunctionA(){
    document.getElementById("address_script").classList.add("bgAndtextcolor");
    document.getElementById("password_script").classList.remove("bgAndtextcolor");
    document.getElementById("information_script").classList.remove("bgAndtextcolor");

    document.getElementById("form3").classList.remove("hidden");
    document.getElementById("form2").classList.add("hidden");
    document.getElementById("form1").classList.add("hidden");

    document.getElementById("adreslerimbuttonu").classList.remove("hidden");
    document.getElementById("form4Update").classList.add("hidden");
    document.getElementById("Adreslerimburada").classList.add("hidden");

    document.getElementById("addressAddButtonu").classList.add("hidden");
}

function validateFunctionName(){
    var elements=  document.getElementsByClassName("validatecontrolName");
    elements[0].classList.add("hidden");
}
function validateFunctionPassword(){
    var elements=  document.getElementsByClassName("validatecontrolPassword");
    elements[0].classList.add("hidden");
}
function validateFunctionRepassword(){
    var elements=  document.getElementsByClassName("validatecontrolRepassword");
    elements[0].classList.add("hidden");
}
function validateFunctionSurname(){
    var elements=  document.getElementsByClassName("validatecontrolSurname");
    elements[0].classList.add("hidden");
}
function validateFunctionUsername(){
    var elements=  document.getElementsByClassName("validatecontrolUsername");
    elements[0].classList.add("hidden");
}
function validateFunctionEmail(){
    var elements=  document.getElementsByClassName("validatecontrolEmail");
    elements[0].classList.add("hidden");
}
function validateFunctionMobilphone(){
    var elements=  document.getElementsByClassName("validatecontrolMobilphone");
    elements[0].classList.add("hidden");
}

function validateFunctionStaticphone(){
    var elements=  document.getElementsByClassName("validatecontrolStaticphone");
    elements[0].classList.add("hidden");
}
function validateFunctionAdress(){
    var elements=  document.getElementsByClassName("validatecontrolAdress");
    elements[0].classList.add("hidden");
}
function togglePasswordFunction() {
    const togglePassword = document.querySelector("#togglePassword");
    const password = document.querySelector("#password");
    const type = password.getAttribute("type") === "password" ? "text" : "password";
    password.setAttribute("type", type);
    togglePassword.classList.toggle("bi-eye");
}
function toggleRepasswordFunction() {
    const toggleRepassword = document.querySelector("#togglerePassword");
    const repassword = document.querySelector("#repassword");
    const type = repassword.getAttribute("type") === "password" ? "text" : "password";
    repassword.setAttribute("type", type);
    toggleRepassword.classList.toggle("bi-eye");
}


function plakasearchCity(city){
    console.log("city ne geliyor:::"+city);
    for (let i=0;i<data.length;i++){
        if(data[i].il===city){

            return data[i].plaka;
        }
    }
}

var data = [
    {
        "il": "Adana",
        "plaka": 1,
        "ilceleri": [
            "Aladağ",
            "Ceyhan",
            "Çukurova",
            "Feke",
            "İmamoğlu",
            "Karaisalı",
            "Karataş",
            "Kozan",
            "Pozantı",
            "Saimbeyli",
            "Sarıçam",
            "Seyhan",
            "Tufanbeyli",
            "Yumurtalık",
            "Yüreğir"
        ]
    },
    {
        "il": "Adıyaman",
        "plaka": 2,
        "ilceleri": [
            "Besni",
            "Çelikhan",
            "Gerger",
            "Gölbaşı",
            "Kahta",
            "Merkez",
            "Samsat",
            "Sincik",
            "Tut"
        ]
    },
    {
        "il": "Afyonkarahisar",
        "plaka": 3,
        "ilceleri": [
            "Başmakçı",
            "Bayat",
            "Bolvadin",
            "Çay",
            "Çobanlar",
            "Dazkırı",
            "Dinar",
            "Emirdağ",
            "Evciler",
            "Hocalar",
            "İhsaniye",
            "İscehisar",
            "Kızılören",
            "Merkez",
            "Sandıklı",
            "Sinanpaşa",
            "Sultandağı",
            "Şuhut"
        ]
    },
    {
        "il": "Ağrı",
        "plaka": 4,
        "ilceleri": [
            "Diyadin",
            "Doğubayazıt",
            "Eleşkirt",
            "Hamur",
            "Merkez",
            "Patnos",
            "Taşlıçay",
            "Tutak"
        ]
    },
    {
        "il": "Amasya",
        "plaka": 5,
        "ilceleri": [
            "Göynücek",
            "Gümüşhacıköy",
            "Hamamözü",
            "Merkez",
            "Merzifon",
            "Suluova",
            "Taşova"
        ]
    },
    {
        "il": "Ankara",
        "plaka": 6,
        "ilceleri": [
            "Altındağ",
            "Ayaş",
            "Bala",
            "Beypazarı",
            "Çamlıdere",
            "Çankaya",
            "Çubuk",
            "Elmadağ",
            "Güdül",
            "Haymana",
            "Kalecik",
            "Kızılcahamam",
            "Nallıhan",
            "Polatlı",
            "Şereflikoçhisar",
            "Yenimahalle",
            "Gölbaşı",
            "Keçiören",
            "Mamak",
            "Sincan",
            "Kazan",
            "Akyurt",
            "Etimesgut",
            "Evren",
            "Pursaklar"
        ]
    },
    {
        "il": "Antalya",
        "plaka": 7,
        "ilceleri": [
            "Akseki",
            "Alanya",
            "Elmalı",
            "Finike",
            "Gazipaşa",
            "Gündoğmuş",
            "Kaş",
            "Korkuteli",
            "Kumluca",
            "Manavgat",
            "Serik",
            "Demre",
            "İbradı",
            "Kemer",
            "Aksu",
            "Döşemealtı",
            "Kepez",
            "Konyaaltı",
            "Muratpaşa"
        ]
    },
    {
        "il": "Artvin",
        "plaka": 8,
        "ilceleri": [
            "Ardanuç",
            "Arhavi",
            "Merkez",
            "Borçka",
            "Hopa",
            "Şavşat",
            "Yusufeli",
            "Murgul"
        ]
    },
    {
        "il": "Aydın",
        "plaka": 9,
        "ilceleri": [
            "Merkez",
            "Bozdoğan",
            "Efeler",
            "Çine",
            "Germencik",
            "Karacasu",
            "Koçarlı",
            "Kuşadası",
            "Kuyucak",
            "Nazilli",
            "Söke",
            "Sultanhisar",
            "Yenipazar",
            "Buharkent",
            "İncirliova",
            "Karpuzlu",
            "Köşk",
            "Didim"
        ]
    },
    {
        "il": "Balıkesir",
        "plaka": 10,
        "ilceleri": [
            "Altıeylül",
            "Ayvalık",
            "Merkez",
            "Balya",
            "Bandırma",
            "Bigadiç",
            "Burhaniye",
            "Dursunbey",
            "Edremit",
            "Erdek",
            "Gönen",
            "Havran",
            "İvrindi",
            "Karesi",
            "Kepsut",
            "Manyas",
            "Savaştepe",
            "Sındırgı",
            "Gömeç",
            "Susurluk",
            "Marmara"
        ]
    },
    {
        "il": "Bilecik",
        "plaka": 11,
        "ilceleri": [
            "Merkez",
            "Bozüyük",
            "Gölpazarı",
            "Osmaneli",
            "Pazaryeri",
            "Söğüt",
            "Yenipazar",
            "İnhisar"
        ]
    },
    {
        "il": "Bingöl",
        "plaka": 12,
        "ilceleri": [
            "Merkez",
            "Genç",
            "Karlıova",
            "Kiğı",
            "Solhan",
            "Adaklı",
            "Yayladere",
            "Yedisu"
        ]
    },
    {
        "il": "Bitlis",
        "plaka": 13,
        "ilceleri": [
            "Adilcevaz",
            "Ahlat",
            "Merkez",
            "Hizan",
            "Mutki",
            "Tatvan",
            "Güroymak"
        ]
    },
    {
        "il": "Bolu",
        "plaka": 14,
        "ilceleri": [
            "Merkez",
            "Gerede",
            "Göynük",
            "Kıbrıscık",
            "Mengen",
            "Mudurnu",
            "Seben",
            "Dörtdivan",
            "Yeniçağa"
        ]
    },
    {
        "il": "Burdur",
        "plaka": 15,
        "ilceleri": [
            "Ağlasun",
            "Bucak",
            "Merkez",
            "Gölhisar",
            "Tefenni",
            "Yeşilova",
            "Karamanlı",
            "Kemer",
            "Altınyayla",
            "Çavdır",
            "Çeltikçi"
        ]
    },
    {
        "il": "Bursa",
        "plaka": 16,
        "ilceleri": [
            "Gemlik",
            "İnegöl",
            "İznik",
            "Karacabey",
            "Keles",
            "Mudanya",
            "Mustafakemalpaşa",
            "Orhaneli",
            "Orhangazi",
            "Yenişehir",
            "Büyükorhan",
            "Harmancık",
            "Nilüfer",
            "Osmangazi",
            "Yıldırım",
            "Gürsu",
            "Kestel"
        ]
    },
    {
        "il": "Çanakkale",
        "plaka": 17,
        "ilceleri": [
            "Ayvacık",
            "Bayramiç",
            "Biga",
            "Bozcaada",
            "Çan",
            "Merkez",
            "Eceabat",
            "Ezine",
            "Gelibolu",
            "Gökçeada",
            "Lapseki",
            "Yenice"
        ]
    },
    {
        "il": "Çankırı",
        "plaka": 18,
        "ilceleri": [
            "Merkez",
            "Çerkeş",
            "Eldivan",
            "Ilgaz",
            "Kurşunlu",
            "Orta",
            "Şabanözü",
            "Yapraklı",
            "Atkaracalar",
            "Kızılırmak",
            "Bayramören",
            "Korgun"
        ]
    },
    {
        "il": "Çorum",
        "plaka": 19,
        "ilceleri": [
            "Alaca",
            "Bayat",
            "Merkez",
            "İskilip",
            "Kargı",
            "Mecitözü",
            "Ortaköy",
            "Osmancık",
            "Sungurlu",
            "Boğazkale",
            "Uğurludağ",
            "Dodurga",
            "Laçin",
            "Oğuzlar"
        ]
    },
    {
        "il": "Denizli",
        "plaka": 20,
        "ilceleri": [
            "Acıpayam",
            "Buldan",
            "Çal",
            "Çameli",
            "Çardak",
            "Çivril",
            "Merkez",
            "Merkezefendi",
            "Pamukkale",
            "Güney",
            "Kale",
            "Sarayköy",
            "Tavas",
            "Babadağ",
            "Bekilli",
            "Honaz",
            "Serinhisar",
            "Baklan",
            "Beyağaç",
            "Bozkurt"
        ]
    },
    {
        "il": "Diyarbakır",
        "plaka": 21,
        "ilceleri": [
            "Kocaköy",
            "Çermik",
            "Çınar",
            "Çüngüş",
            "Dicle",
            "Ergani",
            "Hani",
            "Hazro",
            "Kulp",
            "Lice",
            "Silvan",
            "Eğil",
            "Bağlar",
            "Kayapınar",
            "Sur",
            "Yenişehir",
            "Bismil"
        ]
    },
    {
        "il": "Edirne",
        "plaka": 22,
        "ilceleri": [
            "Merkez",
            "Enez",
            "Havsa",
            "İpsala",
            "Keşan",
            "Lalapaşa",
            "Meriç",
            "Uzunköprü",
            "Süloğlu"
        ]
    },
    {
        "il": "Elazığ",
        "plaka": 23,
        "ilceleri": [
            "Ağın",
            "Baskil",
            "Merkez",
            "Karakoçan",
            "Keban",
            "Maden",
            "Palu",
            "Sivrice",
            "Arıcak",
            "Kovancılar",
            "Alacakaya"
        ]
    },
    {
        "il": "Erzincan",
        "plaka": 24,
        "ilceleri": [
            "Çayırlı",
            "Merkez",
            "İliç",
            "Kemah",
            "Kemaliye",
            "Refahiye",
            "Tercan",
            "Üzümlü",
            "Otlukbeli"
        ]
    },
    {
        "il": "Erzurum",
        "plaka": 25,
        "ilceleri": [
            "Aşkale",
            "Çat",
            "Hınıs",
            "Horasan",
            "İspir",
            "Karayazı",
            "Narman",
            "Oltu",
            "Olur",
            "Pasinler",
            "Şenkaya",
            "Tekman",
            "Tortum",
            "Karaçoban",
            "Uzundere",
            "Pazaryolu",
            "Köprüköy",
            "Palandöken",
            "Yakutiye",
            "Aziziye"
        ]
    },
    {
        "il": "Eskişehir",
        "plaka": 26,
        "ilceleri": [
            "Çifteler",
            "Mahmudiye",
            "Mihalıççık",
            "Sarıcakaya",
            "Seyitgazi",
            "Sivrihisar",
            "Alpu",
            "Beylikova",
            "İnönü",
            "Günyüzü",
            "Han",
            "Mihalgazi",
            "Odunpazarı",
            "Tepebaşı"
        ]
    },
    {
        "il": "Gaziantep",
        "plaka": 27,
        "ilceleri": [
            "Araban",
            "İslahiye",
            "Nizip",
            "Oğuzeli",
            "Yavuzeli",
            "Şahinbey",
            "Şehitkamil",
            "Karkamış",
            "Nurdağı"
        ]
    },
    {
        "il": "Giresun",
        "plaka": 28,
        "ilceleri": [
            "Alucra",
            "Bulancak",
            "Dereli",
            "Espiye",
            "Eynesil",
            "Merkez",
            "Görele",
            "Keşap",
            "Şebinkarahisar",
            "Tirebolu",
            "Piraziz",
            "Yağlıdere",
            "Çamoluk",
            "Çanakçı",
            "Doğankent",
            "Güce"
        ]
    },
    {
        "il": "Gümüşhane",
        "plaka": 29,
        "ilceleri": [
            "Merkez",
            "Kelkit",
            "Şiran",
            "Torul",
            "Köse",
            "Kürtün"
        ]
    },
    {
        "il": "Hakkari",
        "plaka": 30,
        "ilceleri": [
            "Çukurca",
            "Merkez",
            "Şemdinli",
            "Yüksekova"
        ]
    },
    {
        "il": "Hatay",
        "plaka": 31,
        "ilceleri": [
            "Altınözü",
            "Arsuz",
            "Defne",
            "Dörtyol",
            "Hassa",
            "Antakya",
            "İskenderun",
            "Kırıkhan",
            "Payas",
            "Reyhanlı",
            "Samandağ",
            "Yayladağı",
            "Erzin",
            "Belen",
            "Kumlu"
        ]
    },
    {
        "il": "Isparta",
        "plaka": 32,
        "ilceleri": [
            "Atabey",
            "Eğirdir",
            "Gelendost",
            "Merkez",
            "Keçiborlu",
            "Senirkent",
            "Sütçüler",
            "Şarkikaraağaç",
            "Uluborlu",
            "Yalvaç",
            "Aksu",
            "Gönen",
            "Yenişarbademli"
        ]
    },
    {
        "il": "Mersin",
        "plaka": 33,
        "ilceleri": [
            "Anamur",
            "Erdemli",
            "Gülnar",
            "Mut",
            "Silifke",
            "Tarsus",
            "Aydıncık",
            "Bozyazı",
            "Çamlıyayla",
            "Akdeniz",
            "Mezitli",
            "Toroslar",
            "Yenişehir"
        ]
    },
    {
        "il": "İstanbul",
        "plaka": 34,
        "ilceleri": [
            "Adalar",
            "Bakırköy",
            "Beşiktaş",
            "Beykoz",
            "Beyoğlu",
            "Çatalca",
            "Eyüp",
            "Fatih",
            "Gaziosmanpaşa",
            "Kadıköy",
            "Kartal",
            "Sarıyer",
            "Silivri",
            "Şile",
            "Şişli",
            "Üsküdar",
            "Zeytinburnu",
            "Büyükçekmece",
            "Kağıthane",
            "Küçükçekmece",
            "Pendik",
            "Ümraniye",
            "Bayrampaşa",
            "Avcılar",
            "Bağcılar",
            "Bahçelievler",
            "Güngören",
            "Maltepe",
            "Sultanbeyli",
            "Tuzla",
            "Esenler",
            "Arnavutköy",
            "Ataşehir",
            "Başakşehir",
            "Beylikdüzü",
            "Çekmeköy",
            "Esenyurt",
            "Sancaktepe",
            "Sultangazi"
        ]
    },
    {
        "il": "İzmir",
        "plaka": 35,
        "ilceleri": [
            "Aliağa",
            "Bayındır",
            "Bergama",
            "Bornova",
            "Çeşme",
            "Dikili",
            "Foça",
            "Karaburun",
            "Karşıyaka",
            "Kemalpaşa",
            "Kınık",
            "Kiraz",
            "Menemen",
            "Ödemiş",
            "Seferihisar",
            "Selçuk",
            "Tire",
            "Torbalı",
            "Urla",
            "Beydağ",
            "Buca",
            "Konak",
            "Menderes",
            "Balçova",
            "Çiğli",
            "Gaziemir",
            "Narlıdere",
            "Güzelbahçe",
            "Bayraklı",
            "Karabağlar"
        ]
    },
    {
        "il": "Kars",
        "plaka": 36,
        "ilceleri": [
            "Arpaçay",
            "Digor",
            "Kağızman",
            "Merkez",
            "Sarıkamış",
            "Selim",
            "Susuz",
            "Akyaka"
        ]
    },
    {
        "il": "Kastamonu",
        "plaka": 37,
        "ilceleri": [
            "Abana",
            "Araç",
            "Azdavay",
            "Bozkurt",
            "Cide",
            "Çatalzeytin",
            "Daday",
            "Devrekani",
            "İnebolu",
            "Merkez",
            "Küre",
            "Taşköprü",
            "Tosya",
            "İhsangazi",
            "Pınarbaşı",
            "Şenpazar",
            "Ağlı",
            "Doğanyurt",
            "Hanönü",
            "Seydiler"
        ]
    },
    {
        "il": "Kayseri",
        "plaka": 38,
        "ilceleri": [
            "Bünyan",
            "Develi",
            "Felahiye",
            "İncesu",
            "Pınarbaşı",
            "Sarıoğlan",
            "Sarız",
            "Tomarza",
            "Yahyalı",
            "Yeşilhisar",
            "Akkışla",
            "Talas",
            "Kocasinan",
            "Melikgazi",
            "Hacılar",
            "Özvatan"
        ]
    },
    {
        "il": "Kırklareli",
        "plaka": 39,
        "ilceleri": [
            "Babaeski",
            "Demirköy",
            "Merkez",
            "Kofçaz",
            "Lüleburgaz",
            "Pehlivanköy",
            "Pınarhisar",
            "Vize"
        ]
    },
    {
        "il": "Kırşehir",
        "plaka": 40,
        "ilceleri": [
            "Çiçekdağı",
            "Kaman",
            "Merkez",
            "Mucur",
            "Akpınar",
            "Akçakent",
            "Boztepe"
        ]
    },
    {
        "il": "Kocaeli",
        "plaka": 41,
        "ilceleri": [
            "Gebze",
            "Gölcük",
            "Kandıra",
            "Karamürsel",
            "Körfez",
            "Derince",
            "Başiskele",
            "Çayırova",
            "Darıca",
            "Dilovası",
            "İzmit",
            "Kartepe"
        ]
    },
    {
        "il": "Konya",
        "plaka": 42,
        "ilceleri": [
            "Akşehir",
            "Beyşehir",
            "Bozkır",
            "Cihanbeyli",
            "Çumra",
            "Doğanhisar",
            "Ereğli",
            "Hadim",
            "Ilgın",
            "Kadınhanı",
            "Karapınar",
            "Kulu",
            "Sarayönü",
            "Seydişehir",
            "Yunak",
            "Akören",
            "Altınekin",
            "Derebucak",
            "Hüyük",
            "Karatay",
            "Meram",
            "Selçuklu",
            "Taşkent",
            "Ahırlı",
            "Çeltik",
            "Derbent",
            "Emirgazi",
            "Güneysınır",
            "Halkapınar",
            "Tuzlukçu",
            "Yalıhüyük"
        ]
    },
    {
        "il": "Kütahya",
        "plaka": 43,
        "ilceleri": [
            "Altıntaş",
            "Domaniç",
            "Emet",
            "Gediz",
            "Merkez",
            "Simav",
            "Tavşanlı",
            "Aslanapa",
            "Dumlupınar",
            "Hisarcık",
            "Şaphane",
            "Çavdarhisar",
            "Pazarlar"
        ]
    },
    {
        "il": "Malatya",
        "plaka": 44,
        "ilceleri": [
            "Akçadağ",
            "Arapgir",
            "Arguvan",
            "Darende",
            "Doğanşehir",
            "Hekimhan",
            "Merkez",
            "Pütürge",
            "Yeşilyurt",
            "Battalgazi",
            "Doğanyol",
            "Kale",
            "Kuluncak",
            "Yazıhan"
        ]
    },
    {
        "il": "Manisa",
        "plaka": 45,
        "ilceleri": [
            "Akhisar",
            "Alaşehir",
            "Demirci",
            "Gördes",
            "Kırkağaç",
            "Kula",
            "Merkez",
            "Salihli",
            "Sarıgöl",
            "Saruhanlı",
            "Selendi",
            "Soma",
            "Şehzadeler",
            "Yunusemre",
            "Turgutlu",
            "Ahmetli",
            "Gölmarmara",
            "Köprübaşı"
        ]
    },
    {
        "il": "Kahramanmaraş",
        "plaka": 46,
        "ilceleri": [
            "Afşin",
            "Andırın",
            "Dulkadiroğlu",
            "Onikişubat",
            "Elbistan",
            "Göksun",
            "Merkez",
            "Pazarcık",
            "Türkoğlu",
            "Çağlayancerit",
            "Ekinözü",
            "Nurhak"
        ]
    },
    {
        "il": "Mardin",
        "plaka": 47,
        "ilceleri": [
            "Derik",
            "Kızıltepe",
            "Artuklu",
            "Merkez",
            "Mazıdağı",
            "Midyat",
            "Nusaybin",
            "Ömerli",
            "Savur",
            "Dargeçit",
            "Yeşilli"
        ]
    },
    {
        "il": "Muğla",
        "plaka": 48,
        "ilceleri": [
            "Bodrum",
            "Datça",
            "Fethiye",
            "Köyceğiz",
            "Marmaris",
            "Menteşe",
            "Milas",
            "Ula",
            "Yatağan",
            "Dalaman",
            "Seydikemer",
            "Ortaca",
            "Kavaklıdere"
        ]
    },
    {
        "il": "Muş",
        "plaka": 49,
        "ilceleri": [
            "Bulanık",
            "Malazgirt",
            "Merkez",
            "Varto",
            "Hasköy",
            "Korkut"
        ]
    },
    {
        "il": "Nevşehir",
        "plaka": 50,
        "ilceleri": [
            "Avanos",
            "Derinkuyu",
            "Gülşehir",
            "Hacıbektaş",
            "Kozaklı",
            "Merkez",
            "Ürgüp",
            "Acıgöl"
        ]
    },
    {
        "il": "Niğde",
        "plaka": 51,
        "ilceleri": [
            "Bor",
            "Çamardı",
            "Merkez",
            "Ulukışla",
            "Altunhisar",
            "Çiftlik"
        ]
    },
    {
        "il": "Ordu",
        "plaka": 52,
        "ilceleri": [
            "Akkuş",
            "Altınordu",
            "Aybastı",
            "Fatsa",
            "Gölköy",
            "Korgan",
            "Kumru",
            "Mesudiye",
            "Perşembe",
            "Ulubey",
            "Ünye",
            "Gülyalı",
            "Gürgentepe",
            "Çamaş",
            "Çatalpınar",
            "Çaybaşı",
            "İkizce",
            "Kabadüz",
            "Kabataş"
        ]
    },
    {
        "il": "Rize",
        "plaka": 53,
        "ilceleri": [
            "Ardeşen",
            "Çamlıhemşin",
            "Çayeli",
            "Fındıklı",
            "İkizdere",
            "Kalkandere",
            "Pazar",
            "Merkez",
            "Güneysu",
            "Derepazarı",
            "Hemşin",
            "İyidere"
        ]
    },
    {
        "il": "Sakarya",
        "plaka": 54,
        "ilceleri": [
            "Akyazı",
            "Geyve",
            "Hendek",
            "Karasu",
            "Kaynarca",
            "Sapanca",
            "Kocaali",
            "Pamukova",
            "Taraklı",
            "Ferizli",
            "Karapürçek",
            "Söğütlü",
            "Adapazarı",
            "Arifiye",
            "Erenler",
            "Serdivan"
        ]
    },
    {
        "il": "Samsun",
        "plaka": 55,
        "ilceleri": [
            "Alaçam",
            "Bafra",
            "Çarşamba",
            "Havza",
            "Kavak",
            "Ladik",
            "Terme",
            "Vezirköprü",
            "Asarcık",
            "Ondokuzmayıs",
            "Salıpazarı",
            "Tekkeköy",
            "Ayvacık",
            "Yakakent",
            "Atakum",
            "Canik",
            "İlkadım"
        ]
    },
    {
        "il": "Siirt",
        "plaka": 56,
        "ilceleri": [
            "Baykan",
            "Eruh",
            "Kurtalan",
            "Pervari",
            "Merkez",
            "Şirvan",
            "Tillo"
        ]
    },
    {
        "il": "Sinop",
        "plaka": 57,
        "ilceleri": [
            "Ayancık",
            "Boyabat",
            "Durağan",
            "Erfelek",
            "Gerze",
            "Merkez",
            "Türkeli",
            "Dikmen",
            "Saraydüzü"
        ]
    },
    {
        "il": "Sivas",
        "plaka": 58,
        "ilceleri": [
            "Divriği",
            "Gemerek",
            "Gürün",
            "Hafik",
            "İmranlı",
            "Kangal",
            "Koyulhisar",
            "Merkez",
            "Suşehri",
            "Şarkışla",
            "Yıldızeli",
            "Zara",
            "Akıncılar",
            "Altınyayla",
            "Doğanşar",
            "Gölova",
            "Ulaş"
        ]
    },
    {
        "il": "Tekirdağ",
        "plaka": 59,
        "ilceleri": [
            "Çerkezköy",
            "Çorlu",
            "Ergene",
            "Hayrabolu",
            "Malkara",
            "Muratlı",
            "Saray",
            "Süleymanpaşa",
            "Kapaklı",
            "Şarköy",
            "Marmaraereğlisi"
        ]
    },
    {
        "il": "Tokat",
        "plaka": 60,
        "ilceleri": [
            "Almus",
            "Artova",
            "Erbaa",
            "Niksar",
            "Reşadiye",
            "Merkez",
            "Turhal",
            "Zile",
            "Pazar",
            "Yeşilyurt",
            "Başçiftlik",
            "Sulusaray"
        ]
    },
    {
        "il": "Trabzon",
        "plaka": 61,
        "ilceleri": [
            "Akçaabat",
            "Araklı",
            "Arsin",
            "Çaykara",
            "Maçka",
            "Of",
            "Ortahisar",
            "Sürmene",
            "Tonya",
            "Vakfıkebir",
            "Yomra",
            "Beşikdüzü",
            "Şalpazarı",
            "Çarşıbaşı",
            "Dernekpazarı",
            "Düzköy",
            "Hayrat",
            "Köprübaşı"
        ]
    },
    {
        "il": "Tunceli",
        "plaka": 62,
        "ilceleri": [
            "Çemişgezek",
            "Hozat",
            "Mazgirt",
            "Nazımiye",
            "Ovacık",
            "Pertek",
            "Pülümür",
            "Merkez"
        ]
    },
    {
        "il": "Şanlıurfa",
        "plaka": 63,
        "ilceleri": [
            "Akçakale",
            "Birecik",
            "Bozova",
            "Ceylanpınar",
            "Eyyübiye",
            "Halfeti",
            "Haliliye",
            "Hilvan",
            "Karaköprü",
            "Siverek",
            "Suruç",
            "Viranşehir",
            "Harran"
        ]
    },
    {
        "il": "Uşak",
        "plaka": 64,
        "ilceleri": [
            "Banaz",
            "Eşme",
            "Karahallı",
            "Sivaslı",
            "Ulubey",
            "Merkez"
        ]
    },
    {
        "il": "Van",
        "plaka": 65,
        "ilceleri": [
            "Başkale",
            "Çatak",
            "Erciş",
            "Gevaş",
            "Gürpınar",
            "İpekyolu",
            "Muradiye",
            "Özalp",
            "Tuşba",
            "Bahçesaray",
            "Çaldıran",
            "Edremit",
            "Saray"
        ]
    },
    {
        "il": "Yozgat",
        "plaka": 66,
        "ilceleri": [
            "Akdağmadeni",
            "Boğazlıyan",
            "Çayıralan",
            "Çekerek",
            "Sarıkaya",
            "Sorgun",
            "Şefaatli",
            "Yerköy",
            "Merkez",
            "Aydıncık",
            "Çandır",
            "Kadışehri",
            "Saraykent",
            "Yenifakılı"
        ]
    },
    {
        "il": "Zonguldak",
        "plaka": 67,
        "ilceleri": [
            "Çaycuma",
            "Devrek",
            "Ereğli",
            "Merkez",
            "Alaplı",
            "Gökçebey"
        ]
    },
    {
        "il": "Aksaray",
        "plaka": 68,
        "ilceleri": [
            "Ağaçören",
            "Eskil",
            "Gülağaç",
            "Güzelyurt",
            "Merkez",
            "Ortaköy",
            "Sarıyahşi"
        ]
    },
    {
        "il": "Bayburt",
        "plaka": 69,
        "ilceleri": [
            "Merkez",
            "Aydıntepe",
            "Demirözü"
        ]
    },
    {
        "il": "Karaman",
        "plaka": 70,
        "ilceleri": [
            "Ermenek",
            "Merkez",
            "Ayrancı",
            "Kazımkarabekir",
            "Başyayla",
            "Sarıveliler"
        ]
    },
    {
        "il": "Kırıkkale",
        "plaka": 71,
        "ilceleri": [
            "Delice",
            "Keskin",
            "Merkez",
            "Sulakyurt",
            "Bahşili",
            "Balışeyh",
            "Çelebi",
            "Karakeçili",
            "Yahşihan"
        ]
    },
    {
        "il": "Batman",
        "plaka": 72,
        "ilceleri": [
            "Merkez",
            "Beşiri",
            "Gercüş",
            "Kozluk",
            "Sason",
            "Hasankeyf"
        ]
    },
    {
        "il": "Şırnak",
        "plaka": 73,
        "ilceleri": [
            "Beytüşşebap",
            "Cizre",
            "İdil",
            "Silopi",
            "Merkez",
            "Uludere",
            "Güçlükonak"
        ]
    },
    {
        "il": "Bartın",
        "plaka": 74,
        "ilceleri": [
            "Merkez",
            "Kurucaşile",
            "Ulus",
            "Amasra"
        ]
    },
    {
        "il": "Ardahan",
        "plaka": 75,
        "ilceleri": [
            "Merkez",
            "Çıldır",
            "Göle",
            "Hanak",
            "Posof",
            "Damal"
        ]
    },
    {
        "il": "Iğdır",
        "plaka": 76,
        "ilceleri": [
            "Aralık",
            "Merkez",
            "Tuzluca",
            "Karakoyunlu"
        ]
    },
    {
        "il": "Yalova",
        "plaka": 77,
        "ilceleri": [
            "Merkez",
            "Altınova",
            "Armutlu",
            "Çınarcık",
            "Çiftlikköy",
            "Termal"
        ]
    },
    {
        "il": "Karabük",
        "plaka": 78,
        "ilceleri": [
            "Eflani",
            "Eskipazar",
            "Merkez",
            "Ovacık",
            "Safranbolu",
            "Yenice"
        ]
    },
    {
        "il": "Kilis",
        "plaka": 79,
        "ilceleri": [
            "Merkez",
            "Elbeyli",
            "Musabeyli",
            "Polateli"
        ]
    },
    {
        "il": "Osmaniye",
        "plaka": 80,
        "ilceleri": [
            "Bahçe",
            "Kadirli",
            "Merkez",
            "Düziçi",
            "Hasanbeyli",
            "Sumbas",
            "Toprakkale"
        ]
    },
    {
        "il": "Düzce",
        "plaka": 81,
        "ilceleri": [
            "Akçakoca",
            "Merkez",
            "Yığılca",
            "Cumayeri",
            "Gölyaka",
            "Çilimli",
            "Gümüşova",
            "Kaynaşlı"
        ]
    }
]
function search(nameKey, myArray){
    for (var i=0; i < myArray.length; i++) {
        if (myArray[i].plaka == nameKey) {
            return myArray[i];
        }
    }
}
$( document ).ready(function() {
    $.each(data, function( index, value ) {
        $('#form4UpdateCity').append($('<option>', {
            value: value.plaka,
            text:  value.il
        }));
    });
    $("#form4UpdateCity").change(function(){
        var valueSelected = this.value;
        if(($('#form4UpdateCity').val() > 0) || ($('#form4UpdateCity').val() <= 0)) {
            $('#form4UpdateDistrict').html('');
            $('#form4UpdateDistrict').append($('<option>', {
                value: 0,
                text:  'Lütfen Bir İlçe seçiniz'
            }));
            $('#form4UpdateDistrict').prop("disabled", false);
            var resultObject = search($('#form4UpdateCity').val(), data);
            $.each(resultObject.ilceleri, function( index, value ) {
                $('#form4UpdateDistrict').append($('<option>', {
                    value: value,
                    text:  value
                }));
            });
            return false;
        }
        $('#form4UpdateDistrict').prop("disabled", false);
    });
});

// ----------------

function search(nameKey, myArray){
    for (var i=0; i < myArray.length; i++) {
        if (myArray[i].plaka == nameKey) {
            return myArray[i];
        }
    }
}
$( document ).ready(function() {
    $.each(data, function( index, value ) {
        $('#Iller').append($('<option>', {
            value: value.plaka,
            text:  value.il
        }));
    });
    $("#Iller").change(function(){
        var valueSelected = this.value;
        if($('#Iller').val() > 0) {
            $('#Ilceler').html('');
            $('#Ilceler').append($('<option>', {
                value: 0,
                text:  'Lütfen Bir İlçe seçiniz'
            }));
            $('#Ilceler').prop("disabled", false);
            var resultObject = search($('#Iller').val(), data);
            $.each(resultObject.ilceleri, function( index, value ) {
                $('#Ilceler').append($('<option>', {
                    value: value,
                    text:  value
                }));
            });
            return false;
        }
        $('#Ilceler').prop("disabled", false);
    });
});
