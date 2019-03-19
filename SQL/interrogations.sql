-- Dati un 'corso di studi' e una 'coorte' trovare tutte le attività formative ordinate per anno e semestre;
SELECT a.nome, p.anno, p.semestre
FROM propone as p JOIN attivita_formativa as a ON p.attivita_formativa = a.codice
WHERE p.coorte = 2015 and p.corso_laurea = 'IN0508'
ORDER BY p.anno ASC, p.semestre ASC;

-- Dati un 'corso di studi' e una 'coorte': trovare le attività formative attivate ordinate per anno
-- mostrando codice, nome, canale e anno accademico dell'istanza attività formativa e nome + cognome del responsabile
SELECT af.codice, af.nome, i.canale, i.anno_accademico, CONCAT(d.nome, ' ', d.cognome) as responsabile
FROM attiva as a JOIN istanza_attivita_formativa as i 
    ON a.attivita_formativa = i.attivita_formativa 
        AND a.canale = i.canale 
        AND a.anno_accademico = i.anno_accademico 
        AND a.responsabile = i.responsabile
JOIN attivita_formativa as af ON i.attivita_formativa = af.codice
JOIN docente as d ON i.responsabile = d.matricola
WHERE a.coorte = 2015 and a.corso_laurea = 'IN0508'
ORDER BY i.anno_accademico ASC;