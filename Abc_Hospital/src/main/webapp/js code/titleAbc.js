let characterIndex = 0;

    let titleNames = ["A", "AB", "ABC", "ABC H", "ABC HO", "ABC HOS", "ABC HOSP", "ABC HOSPI", "ABC HOSPIT", "ABC HOSPITA", "ABC HOSPITAL"];

    window.updateTitleName = function () {
        document.getElementsByTagName("title")[0].innerHTML = titleNames[characterIndex++ % titleNames.length];
    }

    setInterval(() => {
        window.updateTitleName()
    }, 500);