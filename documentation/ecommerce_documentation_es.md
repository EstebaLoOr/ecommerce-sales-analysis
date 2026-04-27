\# 📊 Análisis de Ventas E-commerce (SQL \+ Power BI)

\# 🧾 Resumen Ejecutivo

Se identificó un crecimiento sostenido en ingresos, alta dependencia de adquisición de nuevos clientes y una gran oportunidad de rentabilidad al incrementar la recompra mediante estrategias de retención.

\#\#\# Valor generado:

💰 \*\*Impacto económico:\*\* Potencial aumento de ingresos de 5% a 12% al elevar la tasa de recompra y ticket promedio de clientes recurrentes.  

📈 \*\*Mejora en KPIs:\*\* Optimización potencial en Repeat Purchase Rate, Customer Lifetime Value (CLV) y Revenue per Customer.  

🎯 \*\*Decisión habilitada:\*\* Priorizar inversión en CRM, email marketing, loyalty programs y remarketing en lugar de depender únicamente de adquisición pagada.

\---

\# 🧠 Contexto y Problema de Negocio

Una empresa de comercio electrónico genera miles de órdenes y ventas mensuales, pero no cuenta con visibilidad clara sobre qué impulsa su crecimiento, cuáles productos sostienen ingresos ni qué tan rentable es su base de clientes actual.

\#\#\# 🏢 Industria / área:

Retail / E-commerce / Business Intelligence

\#\#\# ⚠️ Problema identificado:

El negocio crece en ventas, pero presenta baja retención de clientes y desconocimiento sobre concentración de ingresos.

\#\#\# ❓ Pregunta clave:

¿Cómo aumentar ingresos sostenibles: vendiendo más a nuevos clientes o reteniendo mejor a los existentes?

\---

\# 🎯 Objetivos del Proyecto

\#\#\# 🎯 Objetivo 1:

Medir la evolución mensual de ingresos y órdenes para detectar tendencias de crecimiento.

\#\#\# 🎯 Objetivo 2:

Identificar los productos con mayor contribución económica y evaluar concentración de ventas.

\#\#\# 🎯 Objetivo 3:

Cuantificar el impacto de clientes recurrentes para detectar oportunidades de retención.

\---

\# 📂 Fuentes de Datos y Diccionario de Datos

\#\# Fuentes de datos:

📁 \*\*Fuente 1:\*\* Dataset público Olist (Kaggle) en archivos CSV    
📁 \*\*Fuente 2:\*\* Base de datos relacional en MySQL para análisis SQL

\#\# Descripción general:

\*\*Número de registros:\*\* 100k+ órdenes, 95k+ clientes, 30k+ productos  

\*\*Periodo de tiempo:\*\* Septiembre 2016 – Septiembre 2018

\#\# Diccionario de datos:

| Variable | Tipo | Descripción |  
|--------|------|-------------|  
| order\_id | string | Identificador único de la orden |  
| customer\_unique\_id | string | Identificador único del cliente |  
| order\_purchase\_timestamp | datetime | Fecha de compra |  
| product\_id | string | Identificador del producto |  
| price | num | Precio del producto |  
| freight\_value | num | Costo de envío |  
| revenue | num | price \+ freight\_value |

\---

\# 🛠️ Proceso de ETL / Limpieza de Datos

\#\# Transformaciones clave:

🧹 \*\*Eliminación de datos nulos:\*\* Conversión de campos vacíos a \`NULL\` mediante \`NULLIF()\`.

🔄 \*\*Transformaciones realizadas:\*\*

\- Unión de tablas (\`orders\`, \`customers\`, \`products\`, \`order\_items\`)  
\- Creación de métricas de revenue  
\- Agrupación mensual de ventas  
\- Conteo de órdenes únicas

🧩 \*\*Feature engineering:\*\*

\- Revenue total \= Precio \+ Envío    
\- Average Order Value (AOV)    
\- Repeat Customer Rate    
\- Revenue from Repeat Customers

⚠️ \*\*Decisiones importantes:\*\*

Se utilizó \`customer\_unique\_id\` para medir recurrencia real, evitando duplicados por múltiples cuentas.

\---

\# 🔍 Análisis Exploratorio (EDA) y Hallazgos Clave

\#\# Análisis realizado:

📊 \*\*Distribuciones:\*\*

\- Ventas mensuales  
\- Revenue por producto  
\- Órdenes por cliente

🔗 \*\*Correlaciones:\*\*

\- Mayor volumen de órdenes \= Mayor revenue mensual  
\- Clientes recurrentes \= Mayor valor promedio

🚨 \*\*Anomalías detectadas:\*\*

\- Pico fuerte en noviembre 2017  
\- Caída abrupta al cierre del periodo por corte parcial de datos

\---

\#\# Hallazgos clave:

📌 Los ingresos crecieron consistentemente durante 2017 y 2018, señal de expansión saludable.  

📌 Noviembre 2017 fue el mejor mes, asociado probablemente a Black Friday y promociones estacionales.  

📌 Los Top 10 productos solo representan \~3.18% del revenue, mostrando modelo de ventas diversificado (long tail).  

📌 Solo \~3.05% de clientes recompran, indicando gran área de mejora en retención.  

📌 Los clientes recurrentes generan más valor relativo que los nuevos clientes.

\---

\# 📈 Visualización y Dashboards

\#\# Descripción del dashboard:

Dashboard ejecutivo diseñado en Power BI para monitorear ingresos, órdenes, ticket promedio, productos top y contribución de clientes recurrentes.

Permite responder rápidamente:

\- ¿Estamos creciendo?  
\- ¿Qué productos venden más?  
\- ¿Qué tan fuerte es la recompra?  
\- ¿Dónde enfocar esfuerzos comerciales?

\#\# Métricas clave (KPIs):

📊 \*\*KPI 1:\*\* Revenue Total \= 15.84M  

📊 \*\*KPI 2:\*\* Total Orders \= 99K  

📊 \*\*KPI 3:\*\* AOV \= 155.01  

📊 \*\*KPI 4:\*\* Repeat Customer Rate \= 3.05%

\#\# Herramientas utilizadas:

\- SQL (MySQL)  
\- Power BI

\---

\# 💡 Conclusiones y Recomendaciones Empresariales

\#\# Conclusiones:

🧠 El negocio demuestra tracción comercial sólida, pero depende fuertemente de adquisición constante de nuevos clientes.  

🧠 Existe una oportunidad clara de crecimiento rentable mejorando recompra y valor por cliente actual.

\#\# Recomendaciones:

✅ Implementar campañas de email automation post-compra.  

✅ Crear programa de fidelización con descuentos por segunda compra.  

✅ Lanzar remarketing segmentado para clientes inactivos.  

✅ Analizar categorías con mayor recompra para impulsar bundles y cross-sell.  

✅ Medir cohortes mensuales para monitorear retención real.

\---

\# ⚠️ Limitaciones y Próximos Pasos

\#\# Limitaciones:

⚠️ No se incluyen costos, por lo que no se puede medir utilidad real.  

⚠️ No se analizan canales de adquisición (Meta Ads, Google Ads, orgánico, etc.).  

⚠️ El último periodo parece parcial, afectando comparación final.

\#\# Próximos pasos:

🚀 Incorporar margen bruto y ganancia por producto.  

🚀 Construir análisis de cohortes de retención.  

🚀 Desarrollar forecasting de ventas mensuales.  

🚀 Segmentar clientes por RFM (Recency, Frequency, Monetary).

\---

\# 👤 Autor

\*\*Esteban López Ortega\*\*  

LinkedIn: https://www.linkedin.com/in/esteban-lopez-711527102/

GitHub: https://github.com/EstebaLoOr