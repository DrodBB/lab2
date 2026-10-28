-- Создать таблицу с данными запроса 1 + составы сцепок
-- Сначала удаляем, если таблица уже была создана
DROP TABLE IF EXISTS public.task3_table;

SELECT 
    c.number_scepki,
    c.kol_vagonov,
    c.dlina_scepki,
    c.data_sostavleniya,
    c.vozmozhnost_reversivnogo_dvizheniya,
    s.tramvai_number,
    s.main_tramvai,
    s.vagon_number_in_scepka
INTO public.task3_table
FROM public.scepki c
JOIN public.sostavscepok s ON c.number_scepki = s.number_scepki
WHERE c.vozmozhnost_reversivnogo_dvizheniya = true
  AND c.number_scepki IN (
      -- Полная копия логики 1-го запроса (поиск сцепок с ровно 3 реальными вагонами)
      SELECT number_scepki
      FROM public.sostavscepok
      GROUP BY number_scepki
      HAVING COUNT(*) = 3
  )
ORDER BY c.number_scepki, s.vagon_number_in_scepka;
