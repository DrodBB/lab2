-- Номера ведущих трамваев из сцепок >60м за последний месяц
SELECT s.tramvai_number
FROM public.sostavscepok s
JOIN public.scepki c ON s.number_scepki = c.number_scepki
WHERE c.dlina_scepki > 60
  AND s.main_tramvai = true
  -- Динамический расчет: с 1-го числа прошлого месяца по 1-е число текущего
  AND c.data_sostavleniya >= date_trunc('month', current_date) - interval '1 month'
  AND c.data_sostavleniya <  date_trunc('month', current_date);