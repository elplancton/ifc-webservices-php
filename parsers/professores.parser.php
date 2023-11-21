<?php

function ProfessoresParser($professores)
{
    $dom = new DOMDocument();
    $arq = "professores.xml";

    //criar o doctype - DTD
    $imp = new DOMImplementation();
    $dtd = $imp->createDocumentType('professores', '', 'models/professores.dtd');
    // Creates a DOMDocument instance
    $dom = $imp->createDocument("", "", $dtd);
    $dom->formatOutput = true;

    //crio o elemento
    $professoresEl = $dom->createElement('professores');
    //posiciono o elemento
    $dom->appendChild($professoresEl);

    foreach ($professores as $professor) {
        $professorEl = $dom->createElement('professor');
        $professoresEl->appendChild($professorEl);

        $atr = $dom->createAttribute('id');
        $atr->value = $professor['id'];
        $professorEl->appendChild($atr);

        $nomeprofessor = $dom->createElement('nome', $professor['nome']);
        $professorEl->appendChild($nomeprofessor);

        $emailProfessor = $dom->createElement('email', $professor['email']);
        $professorEl->appendChild($emailProfessor);
    }

    return $dom->saveHTML();
}
