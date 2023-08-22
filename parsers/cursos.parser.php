<?php

function CursosParser($cursos)
{
    $dom = new DOMDocument();
    $arq = "cursos.xml";

    //criar o doctype - DTD
    $imp = new DOMImplementation();
    $dtd = $imp->createDocumentType('cursos', '', 'cursos.dtd');
    // Creates a DOMDocument instance
    $dom = $imp->createDocument("", "", $dtd);
    $dom->formatOutput = true;

    //crio o elemento
    $cursosEl = $dom->createElement('cursos');
    //posiciono o elemento
    $dom->appendChild($cursosEl);

    foreach ($cursos as $curso) {
        $cursoEl = $dom->createElement('curso');
        $cursosEl->appendChild($cursoEl);

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
