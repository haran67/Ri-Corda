function Elimina(obj) {
    smoke.confirm('Attenzione! La voce selezionata verra eliminata in modo permanente,si intende procedere?', function (e) {
        if (e) {
            javascript: __doPostBack(obj, '');
        } else {
            return false;
        }
    }, { ok: "Conferma", cancel: "Annulla" });
    return false;
}

function OperazioneGenerica(msg, obj) {
    smoke.confirm(msg, function (e) {
        if (e) {
            javascript: __doPostBack(obj, '');
        } else {
            return false;
        }
    }, { ok: "Conferma", cancel: "Annulla" });
    return false;
}

function MessaggioGenerico(msg) {
    smoke.alert(msg, function (e) {
        return false;
    });
    return false;
}

function NewWindows(Page, Target, he, wi, menu) {
    OpenWin = this.open(Page, Target, "height=" + he + ",width=" + wi + ",top=0,left=0,toolbar=" + menu + ",menubar=" + menu + ",location=no,scrollbars=yes,resizable=yes");
}

function openModal(name) {
    $(name).modal('show');
}

function closeModal(name) {
    $(name).modal('hide');
}


function PMFailure(error) {
    alert(error._message);
}
function PMSuccess() {
    //alert("Evviva");
}

function setDirtyForm(name) {
    $(name).dirtyForms('setDirty');
}

function setCleanForm(name) {
    $(name).dirtyForms('setClean');
}

/* 
METODI Trim(), LTrim(), RTrim()
Metodi per l'oggetto String, restituiscono la stringa cui sono applicati
senza spazi iniziali e/o finali:

str_a = stringa.Trim();
str_a contiene il valore di stringa senza spazi iniziali ne' finali

str_a = stringa.LTrim();
str_a contiene il valore di stringa senza spazi iniziali

str_a = stringa.RTrim();
str_a contiene il valore di stringa senza spazi finali

N.B.
[\s] nelle RegExp contiene sia gli spazi che i ritorni a capo, avanzamento riga
tabulatore, tabulatore verticale. Tutti questi caratteri, se presenti, verranno eliminati. 
*/
function Trim() {
    return this.replace(/\s+$|^\s+/g, "");
}

function LTrim() {
    return this.replace(/^\s+/, "");
}

function RTrim() {
    return this.replace(/\s+$/, "");
}

String.prototype.Trim = Trim;
String.prototype.RTrim = RTrim;
String.prototype.LTrim = LTrim;


/***********************************************************************************/
/*************** PARTE DEDICATA AI CONTROLLI DEL TAGS TEXTIMPORTO ******************/
/***********************************************************************************/
function ImportoFocus(valore) {
    var numero = '';
    app = valore.value;
    var indicevirgola = valore.value.indexOf(',');
    var appoggio = '';

    if (indicevirgola != -1)
        app = app.substring(0, indicevirgola);

    appoggio = app.split('.');

    // Costruisce la nuova stringa senza carattere 'punto'
    for (i = 0; i < appoggio.length; i++)
        numero += appoggio[i];

    // Assegna al valore della TextBox la stringa ottenuta
    valore.value = numero;

    // Seleziona tutto il contenuto della TextBox
    valore.select();
}
function ImportoBlur(valore, decim) {
    if (valore.value != '') {
        // Assegnazione di variabili
        var indicevirgola = valore.value.indexOf(',');
        var indiceMeno = valore.value.indexOf('-');
        var numero = '';
        var decimale = '';

        // Se è presente la virgola
        if (indicevirgola != -1)
            numero = valore.value.substring(0, indicevirgola);
        else
            numero = valore.value;

        // Se è presente il segno meno '-'
        if (indiceMeno != -1)
            numero = numero.substring(1, valore.value.length);
        else
            numero = numero;

        // Se si considerano le cifre decimali
        if (decim > 0) {
            // Se è presente la virgola
            if (indicevirgola != -1) {
                // Recupera la parte intera e quella decimale
                decimale = valore.value.substring(indicevirgola + 1, valore.value.length);

                // Aggiunge eventuali zeri alla fine
                for (i = decimale.length; i < decim; i++)
                    decimale += '0';
            }
            // Se NON è presente
            else {
                for (i = 0; i < decim; i++)
                    decimale += '0';
            }
        }

        // Se il numero è costituito da più di 3 cifre aggiunge i punti
        if (numero.length > 3) {
            // Assegnazione dei punti
            var mod = (numero.length) % 3;
            var output = numero.substring(0, mod);
            for (i = 0; i < Math.floor(numero.length / 3); i++) {
                if ((mod == 0) && (i == 0))
                    output += numero.substring(mod + 3 * i, mod + 3 * i + 3);
                else
                    output += '.' + numero.substring(mod + 3 * i, mod + 3 * i + 3);
            }
        }
        else
            output = numero;

        if (indiceMeno != -1)
            output = "-" + output;

        // Visualizza la stringa formatta
        if (decim > 0)
            valore.value = output + "," + decimale;
        else
            valore.value = output;
    }
}
/************** Fine parte dedicata al TAG TextImporto ***********/

/***********************************************************************************/
/****************** Parte dedicata ai controlli del TAGS TextNumero ****************/
/***********************************************************************************/
function NumeroKeyPress(fld, e, min, decim) {
    // Se si tenta di premere la virgola e il valore del decimale deve essere di lunghezza 0
    // (ossia un intero) ritorna false
    if (decim == 0 && e.keyCode == 44)
        return false;
    if (min != -1 && min >= 0 && e.keyCode == 45)
        return false;

    // Dichiarazione delle variabili
    var key = '';
    var strCheck = '0123456789';
    var whichCode = (window.Event) ? e.which : e.keyCode;
    if (whichCode == undefined && e.keyCode) whichCode = e.keyCode;
    if (whichCode == 13 || whichCode == 8) return true;  // Enter - Back
    key = String.fromCharCode(whichCode);  // Prende il valore del tasto da Code
    if (fld.value.indexOf(',') == -1) strCheck += ','; // Controlla se c'è già la virgola
    if (fld.value.indexOf('-') == -1) strCheck += '-'; // Controlla se c'è già il segno
    if (strCheck.indexOf(key) == -1) return false;  // Tasto non valido

    // Se viene premuto il tasto - l'aggiunge ad inizio stringa
    if (key == '-') {
        fld.value = '-' + fld.value;
        return false;
    }
}
function NumeroKeyUp(fld, min, max, decim) {
    // Dichiarazione delle variabili
    var decimale = '';
    var appoggio;
    var numero = '';
    var indicevirgola = fld.value.indexOf(',');

    if (decim > 0) {
        // Costruzione della stringa decimale
        decimale = ',';
        for (i = 0; i < decim; i++)
            decimale += '0';

        // Assegnazione del numero dopo la virgola
        numero = fld.value.substring(indicevirgola + 1, fld.value.length);

        // Se si supera il limite di decimale annulla il numero inserito
        if (indicevirgola != -1 && numero.length > decim)
            fld.value = fld.value.substring(0, fld.value.indexOf(',') + (decim + 1))
    }

    if (indicevirgola == -1)
        appoggio = fld.value;
    else
        appoggio = fld.value.substring(0, fld.value.indexOf(','));

    // Se si è superato il numero massimo consentito
    if (max != -1 && appoggio > max) {
        // Se non sono consentiti numeri decimali
        if (decim > 0) {
            // Se non c'è la virgola nella stringa
            if (indicevirgola == -1) {
                fld.value = fld.value.substring(0, fld.value.length - 1) + ',' + fld.value.substring(fld.value.length - 1, fld.value.length);
                if (fld.value.substring(0, fld.value.length - 2) == max && fld.value.substring(fld.value.length - 1, fld.value.length) != 0)
                    fld.value = max + decimale;
            }
            else {
                fld.value = max;
            }
        }
        else {
            fld.value = max + decimale;
        }
    }
    if (min != -1 && appoggio < min) {
        if (decim > 0) {
            if (indicevirgola == -1) {
                fld.value = fld.value.substring(0, fld.value.length - 1) + ',' + fld.value.substring(fld.value.length - 1, fld.value.length);
                if (fld.value.substring(0, fld.value.length - 2) == min && fld.value.substring(fld.value.length - 1, fld.value.length) != 0)
                    fld.value = min + decimale;
            }
            else {
                fld.vlaue = min + decimale;
            }
        }
    }
}
function NumeroFocus(valore) {
    // Seleziona tutto il contenuto della TextBox
    valore.select();
}
function NumeroBlur(valore, decim) {
    if (valore.value != '') {
        // Assegnazione di variabili
        var indicevirgola = valore.value.indexOf(',');
        var numero = '';
        var decimale = '';
        //Se si considerano le cifre decimali
        if (decim > 0) {
            // Se è presente la virgola
            if (indicevirgola != -1) {
                //Recupera la parte intera e quella decimale
                decimale = valore.value.substring(indicevirgola + 1, valore.value.length);
                numero = valore.value.substring(0, valore.value.length - (decimale.length + 1));
                //Aggiunge eventuali zeri alla fine
                for (i = decimale.length; i < decim; i++)
                    decimale += '0';
            }
            // Se NON è presente
            else {
                for (i = 0; i < decim; i++)
                    decimale += '0';
                numero = valore.value;
            }
        }
        // Altrimenti
        else
            numero = valore.value;

        output = numero;

        // Visualizza la stringa formatta
        if (decim > 0)
            valore.value = output + "," + decimale;
        else
            valore.value = output;
    }
}
/************** Fine parte dedicata al TAG TextNumero ***********/

/***********************************************************************************/
/******************** Parte dedicata al TAG TextData & TextOra *********************/
/***********************************************************************************/
function DataFocus(fld) {
    // Seleziona tutto il contenuto della TextBox
    fld.select();
}

function DataKeyPress(fld, e) {
    var key = '';
    var strCheck = '0123456789';
    var whichCode = (window.Event) ? e.which : e.keyCode;
    if (whichCode == undefined && e.keyCode) whichCode = e.keyCode;
    //alert(whichCode);
    if (whichCode == 13 || whichCode == 8) return true;  // Enter - Back
    key = String.fromCharCode(whichCode);  // Prende il valore del tasto da Code 
    if (strCheck.indexOf(key) == -1) return false;  // Tasto non valido 
    // Tasto Valido  
    if (fld.value.length == 2) {
        fld.value = fld.value + '/';
    }
    if (fld.value.length == 5) {
        fld.value = fld.value + '/';
    }
}

function DataBlur(ctr) {
    if (ValidTrim(ctr.value).length == 0) {
        ctr.style.color = '';
        return true; // stringa vuota tutto ok 
    }

    if (IsValidDate(ctr, 'dmy')) {
        ctr.style.color = '';
        return true;
    }
    else {
        ctr.style.color = 'red';
        return false;
    }
}

function OraFocus(fld) {
    // Seleziona tutto il contenuto della TextBox
    fld.select();
}

function OraKeyPress(fld, e) {
    var key = '';
    var strCheck = '0123456789';
    var whichCode = (window.Event) ? e.which : e.keyCode;
    if (whichCode == undefined && e.keyCode) whichCode = e.keyCode;
    if (whichCode == 13 || whichCode == 8) return true;  // Enter - Back
    key = String.fromCharCode(whichCode);  // Prende il valore del tasto da Code 
    if (strCheck.indexOf(key) == -1) return false;  // Tasto non valido 
    // Tasto Valido  
    if (fld.value.length == 2) {
        fld.value = fld.value + ':';
    }
}

function OraBlur(ctr) {
    if (ValidTrim(ctr.value).length == 0) {
        ctr.style.color = '';
        return true; // stringa vuota tutto ok 
    }
    if (isValidTime(ctr)) {
        ctr.style.color = '';
        return true;
    }
    else {
        ctr.style.color = 'red';
        return false;
    }
}

function ValidTrim(s) {
    var m = s.match(/^\s*(\S+(\s+\S+)*)\s*$/);
    return (m == null) ? '' : m[1];
}

function IsValidDate(ctr, dateorder) {

    function GetFullYear(year) {
        return (year + parseInt('2000')) - ((year < 2029) ? 0 : 100);
    }

    var m;
    var op = ctr.value;


    var yearFirstExp = new RegExp('^\\s*((\\d{4})|(\\d{2}))([-./])(\\d{1,2})\\4(\\d{1,2})\\s*$');

    m = op.match(yearFirstExp);
    var day, month, year;
    if (m != null && (m[2].length == 4 || dateorder == 'ymd')) {
        day = m[6];
        month = m[5];
        year = (m[2].length == 4) ? m[2] : GetFullYear(parseInt(m[3], 10))
    }
    else {
        if (dateorder == 'ymd') {
            return null;
        }
        var yearLastExp = new RegExp('^\\s*(\\d{1,2})([-./])(\\d{1,2})\\2((\\d{4})|(\\d{2}))\\s*$');
        m = op.match(yearLastExp);
        if (m == null) {
            return null;
        }
        if (dateorder == 'mdy') {
            day = m[3];
            month = m[1];
        }
        else {
            day = m[1];
            month = m[3];
        }
        year = (m[5].length == 4) ? m[5] : GetFullYear(parseInt(m[6], 10))
    }
    month -= 1;
    var date = new Date(year, month, day);
    if (typeof (date) == 'object' && year == date.getFullYear() && month == date.getMonth() && day == date.getDate()) {
        var daypad, monpad;
        daypad = date.getDate() + '';
        if (daypad.length == 1) daypad = '0' + daypad;
        monpad = (date.getMonth() + 1) + '';
        if (monpad.length == 1) monpad = '0' + monpad;
        ctr.value = daypad + '/' + monpad + '/' + date.getFullYear()
    }
    return (typeof (date) == 'object' && year == date.getFullYear() && month == date.getMonth() && day == date.getDate()) ? date.valueOf() : null;
}

function isValidTime(modulo) {
    if (modulo == null) {
        return true;
    }
    var datePat = /^(\d{1,2})(\.|:)(\d{1,2})$/;
    var dateStr = modulo.value;
    var matchArray = dateStr.match(datePat); // is the format ok?

    if (modulo.value == "") {
        return true;
    }
    if (matchArray == null) {
        return false;
    }
    minuti = matchArray[3]; // parse date into variables
    ore = matchArray[1];
    if (minuti < 0 || minuti > 59) { // check minuti range
        return false;
    }
    if (ore < 0 || ore > 23) {
        return false;
    }
    return true;  // time is valid
}

/*********** Fine parte dedicata al TAG TextData ************/

/***********************************************************************************/
/*********************** Parte dedicata al TAG TextTesto ***************************/
/***********************************************************************************/
function FiltraTastiAlfaNum(t, e) {
    var pattern = /[\w&@\(\)\?%'\.\-_\+\*\\\/\s]/;
    //alert('[' + event.keyCode + '] ' + String.fromCharCode(event.keyCode));
    var c = String.fromCharCode(event.keyCode);
    res = c.search(pattern);
    //alert(res + '-' + (res != -1));
    return (res != -1);
}
/*********** Fine parte dedicata al TAG TextTesto ************/

/***********************************************************************************/
/* CORRETTORE DI BUG PER RADIOBUTTON IN REPEATER */
/***********************************************************************************/

function SetUniqueRadioButton(nameregex, current) {
    re = new RegExp(nameregex);
    for (i = 0; i < document.forms[0].elements.length; i++) {
        elm = document.forms[0].elements[i]
        if (elm.type == 'radio') {
            //alert(elm.id)
            //alert(re.test(elm.id))
            if (re.test(elm.id)) {
                elm.checked = false;
            }
        }
    }
    current.checked = true;
}