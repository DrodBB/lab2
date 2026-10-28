SELECT c.*
FROM public.scepki c
JOIN public.sostavscepok s ON c.number_scepki = s.number_scepki
WHERE c.vozmozhnost_reversivnogo_dvizheniya = true
GROUP BY c.number_scepki, c.kol_vagonov, c.dlina_scepki,
         c.data_sostavleniya, c.vozmozhnost_reversivnogo_dvizheniya
HAVING COUNT(s.tramvai_number) = 3;