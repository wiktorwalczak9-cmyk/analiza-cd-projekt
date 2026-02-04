# analiza-cd-projekt

Analiza marży netto oraz dynamiki wzrostu rok do roku (YoY) na podstawie danych finansowych spółki w ujęciu rocznym (FY).

## Zakres analizy
Analiza została przeprowadzona na danych zagregowanych rocznie (FY).  
Do obliczeń wykorzystano zapytania SQL, a wizualizacje przygotowano w Excelu.

## Metody
- **Net Margin** – relacja zysku netto do przychodów (`net_profit / revenue`)
- **YoY Growth (%)** – dynamika zmiany zysku netto rok do roku
- **Analiza trendów** – wykresy liniowe marży netto i YoY growth
- **Analiza relacji rentowność–wzrost** – wykres punktowy Net Margin vs YoY Growth

## Klasyfikacja lat
Lata sklasyfikowano na podstawie progów:
- **HIGH GROWTH + HIGH QUALITY**: YoY > 50% i Net Margin > 30%
- **STABLE, HIGH QUALITY**: Net Margin > 30% i YoY ≤ 50%
- **WEAK / NORMAL**: pozostałe przypadki

Klasyfikacja została wykonana przy użyciu instrukcji `CASE WHEN` w SQL.

## Wnioski
- Brak liniowej zależności pomiędzy marżą netto a dynamiką wzrostu.
- Rok 2020 stanowi obserwację odstającą (outlier) – wzrost o charakterze jednorazowym.
- Po silnej korekcie w 2021 r. nastąpiła faza stabilizacji wzrostu.
- W latach 2022–2024 marża netto stopniowo rośnie, podczas gdy YoY growth pozostaje umiarkowany.
- W 2024 r. spółka osiąga wysoką rentowność przy niskiej dynamice wzrostu, co sugeruje fazę dojrzewania modelu biznesowego i nacisk na efektywność.
