<?php

function CursosParser($cursos)
{
    $dom = new DOMDocument();

    $imp = new DOMImplementation();
    $dtd = $imp->createDocumentType('cursos', '', 'models/cursos.dtd');
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

        $nomeCurso = $dom->createElement('nome',   htmlspecialchars($curso['nome'], ENT_NOQUOTES, "UTF-8"));
        $cursoEl->appendChild($nomeCurso);

        $semestresCurso = $dom->createElement('semestres', $curso['semestres']);
        $cursoEl->appendChild($semestresCurso);

        $coordenadorCurso = $dom->createElement('coordenador');
        $cursoEl->appendChild($coordenadorCurso);

        $coordenadorId = $dom->createAttribute('id');
        $coordenadorId->value = $curso['id_coordenador'];
        $coordenadorCurso->appendChild($coordenadorId);

        $coordenadorNome = $dom->createElement('nome', html_entity_decode($curso['coordenador_nome'], ENT_QUOTES));
        $coordenadorCurso->appendChild($coordenadorNome);
    }

    return $dom->saveHTML();
}
