<?php

function CursoParser($professores)
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

    foreach ($professores as $curso) {
        $cursoEl = $dom->createElement('curso');
        $professoresEl->appendChild($cursoEl);

        $atr = $dom->createAttribute('id');
        $atr->value = $curso['id'];
        $cursoEl->appendChild($atr);

        $nomeCurso = $dom->createElement('nome', $curso['name']);
        $cursoEl->appendChild($nomeCurso);

        $coordenadorCurso = $dom->createElement('coordenador');
        $cursoEl->appendChild($coordenadorCurso);

        $coordenadorId = $dom->createAttribute('id');
        $coordenadorId->value = $curso['id_coordenador'];
        $coordenadorCurso->appendChild($coordenadorId);

        $coordenadorNome = $dom->createElement('nome', $curso['coordenador_nome']);
        $coordenadorCurso->appendChild($coordenadorNome);
    }

    $dom->save($arq);
}
