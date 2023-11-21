<?php

function DisciplinasParser($disciplinas)
{
    $dom = new DOMDocument();

    //criar o doctype - DTD
    $imp = new DOMImplementation();
    $dtd = $imp->createDocumentType('disciplinas', '', 'models/disciplinas.dtd');
    // Creates a DOMDocument instance
    $dom = $imp->createDocument("", "", $dtd);
    $dom->formatOutput = true;

    //crio o elemento
    $disciplinasEl = $dom->createElement('disciplinas');
    //posiciono o elemento
    $dom->appendChild($disciplinasEl);

    foreach ($disciplinas as $disciplina) {
        $disciplinaEl = $dom->createElement('disciplina');
        $disciplinasEl->appendChild($disciplinaEl);

        $atr = $dom->createAttribute('id');
        $atr->value = $disciplina['id'];
        $disciplinaEl->appendChild($atr);

        $codigodisciplina = $dom->createElement('codigo', $disciplina['codigo']);
        $disciplinaEl->appendChild($codigodisciplina);

        $nomedisciplina = $dom->createElement('nome', $disciplina['nome']);
        $disciplinaEl->appendChild($nomedisciplina);

        $cargadisciplina = $dom->createElement('carga', $disciplina['carga']);
        $disciplinaEl->appendChild($cargadisciplina);

        $ementadisciplina = $dom->createElement('ementa', $disciplina['ementa']);
        $disciplinaEl->appendChild($ementadisciplina);

        $semestredisciplina = $dom->createElement('semestre', $disciplina['semestre']);
        $disciplinaEl->appendChild($semestredisciplina);

        $cursoDisciplina = $dom->createElement('curso');
        $disciplinaEl->appendChild($cursoDisciplina);
        $cursoNomeDisciplina = $dom->createElement('nome', $disciplina['curso_nome']);
        $cursoDisciplina->appendChild($cursoNomeDisciplina);
    }

    return $dom->saveHTML();
}
