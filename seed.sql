CREATE TABLE IF NOT EXISTS questions (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    category TEXT NOT NULL,
    level TEXT NOT NULL,
    text TEXT NOT NULL,
    audience TEXT NOT NULL DEFAULT 'establecida',
    ages TEXT NOT NULL DEFAULT 'all'
);

CREATE INDEX IF NOT EXISTS idx_cat_lvl ON questions(category, level);
CREATE INDEX IF NOT EXISTS idx_audience ON questions(audience);

-- ============================================================
-- REVELACIONES ÍNTIMAS
-- ============================================================
-- Suave
INSERT INTO questions (category, level, text) VALUES
('revelaciones', 'suave', '¿Cuál es el recuerdo más feliz que tienes de nuestra relación?'),
('revelaciones', 'suave', '¿Qué pensaste la primera vez que me viste?'),
('revelaciones', 'suave', '¿Cuál es la canción que te recuerda a mí?'),
('revelaciones', 'suave', '¿Qué momento conmigo guardas en secreto para tus días grises?'),
('revelaciones', 'suave', '¿Qué fue lo primero que te llamó la atención de mí?'),
('revelaciones', 'suave', '¿Cuándo supiste que querías estar conmigo?'),
('revelaciones', 'suave', '¿Qué pequeño detalle mío te enamora cada día?'),
('revelaciones', 'suave', '¿Cuál ha sido nuestra mejor cita hasta ahora?'),
('revelaciones', 'suave', '¿Qué olor te recuerda inevitablemente a mí?'),
('revelaciones', 'suave', '¿Qué le contaste a tu mejor amig@ la primera vez que hablaste de mí?'),
('revelaciones', 'suave', '¿Qué canción nos definiría como pareja?'),
('revelaciones', 'suave', '¿Qué momento juntos volverías a vivir exactamente igual?');

-- Picante
INSERT INTO questions (category, level, text) VALUES
('revelaciones', 'picante', '¿Cuál es la mentira más grande que me has dicho?'),
('revelaciones', 'picante', '¿Hay algo de tu pasado que nunca me hayas contado y quieras compartir ahora?'),
('revelaciones', 'picante', '¿Qué inseguridad tienes conmigo que nunca te has atrevido a decirme?'),
('revelaciones', 'picante', '¿Cuál ha sido el momento en que más miedo has tenido de perderme?'),
('revelaciones', 'picante', '¿Cuándo me has querido decir algo importante y te has callado?'),
('revelaciones', 'picante', '¿Qué crees que pienso de ti que no te atreves a preguntarme?'),
('revelaciones', 'picante', '¿Cuál ha sido tu mayor decepción conmigo?'),
('revelaciones', 'picante', '¿Qué cosa mía te ha hecho dudar de la relación alguna vez?'),
('revelaciones', 'picante', '¿Hay algo que hayas hecho por mí y que no sepa?'),
('revelaciones', 'picante', '¿De qué te arrepientes en nuestra relación?'),
('revelaciones', 'picante', '¿Qué celos has sentido y nunca me has confesado?'),
('revelaciones', 'picante', '¿Qué necesitas de mí que aún no te he sabido dar?');

-- Sin filtros
INSERT INTO questions (category, level, text) VALUES
('revelaciones', 'sin-filtros', '¿Has fantaseado alguna vez con romper conmigo? ¿Cuándo?'),
('revelaciones', 'sin-filtros', '¿Cuál es la verdad más dura que crees que necesito escuchar?'),
('revelaciones', 'sin-filtros', '¿Qué secreto tuyo no piensas contarme nunca? (puedes darme una pista)'),
('revelaciones', 'sin-filtros', '¿Has llegado a sentirte atraíd@ por alguien estando conmigo?'),
('revelaciones', 'sin-filtros', '¿Hay algo que hiciste antes de mí que te avergonzaría que supiera?'),
('revelaciones', 'sin-filtros', '¿Cuál es la cosa más egoísta que has hecho en nuestra relación?'),
('revelaciones', 'sin-filtros', '¿Me has comparado con alguna ex? ¿En qué?'),
('revelaciones', 'sin-filtros', '¿Qué piensas realmente de mi familia?'),
('revelaciones', 'sin-filtros', '¿En qué momento has fingido sentir algo que no sentías conmigo?'),
('revelaciones', 'sin-filtros', '¿Qué te frustra de mí pero nunca te atreves a sacar?'),
('revelaciones', 'sin-filtros', '¿Has revisado mi móvil alguna vez?'),
('revelaciones', 'sin-filtros', '¿Cuál es tu mayor miedo respecto a nosotros que nunca verbalizas?');

-- ============================================================
-- COMPLICIDAD
-- ============================================================
-- Suave
INSERT INTO questions (category, level, text) VALUES
('complicidad', 'suave', '¿Cuál crees que es mi comida favorita?'),
('complicidad', 'suave', 'Si tuvieras que describirme con tres palabras, ¿cuáles serían?'),
('complicidad', 'suave', '¿Qué peli ponemos siempre que no sabemos qué ver?'),
('complicidad', 'suave', '¿Cuál es mi mayor manía y cómo la imitas?'),
('complicidad', 'suave', '¿Qué saludo o gesto solo es nuestro?'),
('complicidad', 'suave', '¿Cuál es la broma interna que más nos hace reír?'),
('complicidad', 'suave', '¿Qué crees que haría yo si me tocara la lotería?'),
('complicidad', 'suave', 'Si fuéramos un dúo famoso, ¿quiénes seríamos?'),
('complicidad', 'suave', '¿Qué animal me representa mejor según tú?'),
('complicidad', 'suave', '¿En qué soy mejor que tú y lo admites sin problema?'),
('complicidad', 'suave', '¿Qué emoji usaríamos para describirnos como pareja?'),
('complicidad', 'suave', '¿Qué cosa de las que hago te saca una sonrisa sin querer?');

-- Picante
INSERT INTO questions (category, level, text) VALUES
('complicidad', 'picante', '¿En qué sigo siendo un misterio para ti?'),
('complicidad', 'picante', '¿Qué crees que diría yo de ti si me preguntaran en secreto?'),
('complicidad', 'picante', 'Si me hicieran un test psicológico, ¿qué saldría que tú ya sabes?'),
('complicidad', 'picante', '¿Qué decisión mía nunca acabaste de entender?'),
('complicidad', 'picante', '¿Cuál es la mayor diferencia entre nosotros y cómo la llevas?'),
('complicidad', 'picante', '¿Qué pequeña traición me harías si supieras que nunca lo descubriría?'),
('complicidad', 'picante', '¿En qué momento has tenido que tragarte algo por mí?'),
('complicidad', 'picante', 'Si tuvieras que cambiar una cosa de mi forma de ser, ¿cuál sería?'),
('complicidad', 'picante', '¿Qué amig@ mío/a no te termina de convencer?'),
('complicidad', 'picante', '¿Qué fue lo último que te molestó de mí y no me dijiste?'),
('complicidad', 'picante', '¿Qué reto crees que no superaríamos como pareja?'),
('complicidad', 'picante', '¿En qué crees que te miento por costumbre?');

-- Sin filtros
INSERT INTO questions (category, level, text) VALUES
('complicidad', 'sin-filtros', '¿Qué parte de mí conoces mejor que yo mism@?'),
('complicidad', 'sin-filtros', 'Si me dejaras una nota de despedida, ¿qué pondría?'),
('complicidad', 'sin-filtros', '¿Qué piensas cuando lloro?'),
('complicidad', 'sin-filtros', '¿En qué momento te has sentido sol@ a mi lado?'),
('complicidad', 'sin-filtros', '¿Cómo de honest@ eres conmigo en una escala del 1 al 10? Justifícalo.'),
('complicidad', 'sin-filtros', '¿Qué emoción mía te cuesta gestionar?'),
('complicidad', 'sin-filtros', '¿Qué dirías de mí en mi funeral?'),
('complicidad', 'sin-filtros', '¿Cuándo te has sentido superior a mí?'),
('complicidad', 'sin-filtros', '¿Cuándo te has sentido inferior a mí?'),
('complicidad', 'sin-filtros', '¿Qué de mí te recuerda a algo doloroso de tu pasado?'),
('complicidad', 'sin-filtros', '¿Qué necesitas que te diga ahora mismo y no te he dicho nunca?'),
('complicidad', 'sin-filtros', 'Si tuvieras que pedirme perdón por algo, ¿por qué sería?');

-- ============================================================
-- FUTURO
-- ============================================================
-- Suave
INSERT INTO questions (category, level, text) VALUES
('futuro', 'suave', '¿Dónde nos imaginas viviendo en 5 años?'),
('futuro', 'suave', '¿Qué viaje quieres hacer conmigo antes que con nadie?'),
('futuro', 'suave', '¿Cómo sería un fin de semana perfecto para nosotros dentro de 10 años?'),
('futuro', 'suave', '¿Qué tradición te gustaría que tuviéramos como pareja?'),
('futuro', 'suave', '¿Qué te gustaría aprender conmigo?'),
('futuro', 'suave', '¿Cómo te imaginas nuestra casa ideal?'),
('futuro', 'suave', '¿Qué mascota tendríamos y cómo se llamaría?'),
('futuro', 'suave', '¿Qué hábito nuestro quieres conservar para siempre?'),
('futuro', 'suave', '¿Cómo celebraríamos nuestros 50 años juntos?'),
('futuro', 'suave', '¿Qué quieres que sigamos haciendo aunque seamos abuelos?'),
('futuro', 'suave', '¿Qué te gustaría que dijéramos al mirar atrás dentro de 30 años?'),
('futuro', 'suave', '¿Qué meta quieres que cumplamos juntos este año?');

-- Picante
INSERT INTO questions (category, level, text) VALUES
('futuro', 'picante', '¿Quieres tener hij@s conmigo? Sé sincer@.'),
('futuro', 'picante', '¿Cuál es el siguiente paso que crees que deberíamos dar y aún no hemos hablado?'),
('futuro', 'picante', '¿Qué te frena para comprometerte más conmigo?'),
('futuro', 'picante', '¿Cómo crees que reaccionaríamos a una infidelidad?'),
('futuro', 'picante', '¿Qué cambiarías en nuestra relación a partir de mañana?'),
('futuro', 'picante', '¿Hasta dónde estás dispuest@ a mudarte por mí?'),
('futuro', 'picante', '¿Qué harías si me ofrecieran un trabajo lejos y tuvieras que venir conmigo?'),
('futuro', 'picante', '¿Qué tema pendiente nuestro evitas hablar y necesitamos cerrar?'),
('futuro', 'picante', '¿Qué crees que nos rompería como pareja?'),
('futuro', 'picante', '¿Qué deberíamos dejar de hacer ya para tener mejor futuro?'),
('futuro', 'picante', '¿Cuándo crees que sabremos si esto va en serio "para siempre"?'),
('futuro', 'picante', 'Si pudieras saber el final de nuestra historia, ¿lo querrías saber?');

-- Sin filtros
INSERT INTO questions (category, level, text) VALUES
('futuro', 'sin-filtros', 'Si me pasara algo grave mañana, ¿qué harías con tu vida?'),
('futuro', 'sin-filtros', '¿Te ves envejeciendo conmigo de verdad o es algo que te dices?'),
('futuro', 'sin-filtros', '¿Cuánto tiempo aguantarías sol@ si me fuera?'),
('futuro', 'sin-filtros', '¿En qué punto te plantearías dejarme?'),
('futuro', 'sin-filtros', '¿Qué condición tendría que cumplir nuestra relación para que la dejaras hoy?'),
('futuro', 'sin-filtros', '¿Cómo sería tu vida ideal si yo no estuviera en ella?'),
('futuro', 'sin-filtros', 'Si pudieras casarte hoy conmigo sin avisar a nadie, ¿lo harías?'),
('futuro', 'sin-filtros', '¿Qué temas crees que serán nuestros problemas dentro de 10 años?'),
('futuro', 'sin-filtros', '¿Qué heredarías de mí si nos casáramos y luego me pasara algo?'),
('futuro', 'sin-filtros', '¿Has imaginado tu vida con otra persona estando conmigo?'),
('futuro', 'sin-filtros', 'Si tuvieras que ponerle un porcentaje a "vamos a durar", ¿cuál sería?'),
('futuro', 'sin-filtros', '¿Qué precio pondrías a nuestra relación si alguien la quisiera comprar?');

-- ============================================================
-- INTIMIDAD
-- ============================================================
-- Suave
INSERT INTO questions (category, level, text) VALUES
('intimidad', 'suave', '¿Cuál es tu forma favorita de que te abrace?'),
('intimidad', 'suave', '¿Qué gesto cariñoso mío te derrite?'),
('intimidad', 'suave', '¿Dónde te gusta más que te bese?'),
('intimidad', 'suave', '¿Qué te hace sentir más cerca de mí emocionalmente?'),
('intimidad', 'suave', '¿Qué momento del día prefieres para estar conmigo?'),
('intimidad', 'suave', '¿Cómo te gustaría que te despertara?'),
('intimidad', 'suave', '¿Qué te transmite seguridad cuando estás conmigo?'),
('intimidad', 'suave', '¿Cuándo te sientes más amad@ por mí?'),
('intimidad', 'suave', '¿Qué necesitas más a menudo: caricias, palabras o miradas?'),
('intimidad', 'suave', '¿Qué te gusta que te diga al oído sin venir a cuento?'),
('intimidad', 'suave', '¿Cómo describirías nuestro primer beso ahora?'),
('intimidad', 'suave', '¿Qué pequeño gesto te gustaría que tuviéramos cada día?');

-- Picante
INSERT INTO questions (category, level, text) VALUES
('intimidad', 'picante', '¿Qué prenda mía te gusta más quitarme?'),
('intimidad', 'picante', '¿Cuál ha sido nuestro encuentro más memorable?'),
('intimidad', 'picante', '¿Qué fantasía has tenido conmigo y no te has atrevido a contarme?'),
('intimidad', 'picante', '¿Dónde te gustaría que volviéramos a repetir "aquello"?'),
('intimidad', 'picante', '¿Qué te excita de mí que no te he dicho que sé?'),
('intimidad', 'picante', '¿En qué lugar arriesgado te gustaría que nos atreviéramos?'),
('intimidad', 'picante', '¿Qué te gusta más: la previa, el momento o el después?'),
('intimidad', 'picante', '¿Qué canción pondrías para nuestra próxima noche?'),
('intimidad', 'picante', '¿Qué parte de mi cuerpo te tiene obsesionad@?'),
('intimidad', 'picante', '¿Qué te gustaría que te susurrara más a menudo?'),
('intimidad', 'picante', '¿Qué juego de pareja te gustaría probar conmigo?'),
('intimidad', 'picante', '¿Qué prenda quieres verme puest@ esta semana?');

-- Sin filtros
INSERT INTO questions (category, level, text) VALUES
('intimidad', 'sin-filtros', '¿Qué te gustaría hacer conmigo que aún no hemos hecho?'),
('intimidad', 'sin-filtros', '¿Qué fantasía tuya nunca cumpliré y aceptas?'),
('intimidad', 'sin-filtros', '¿Cuántas veces a la semana querrías que tuviéramos sexo si fuera por ti?'),
('intimidad', 'sin-filtros', '¿Cuándo finges placer y por qué?'),
('intimidad', 'sin-filtros', '¿Qué te gustaría que cambiara yo en la cama?'),
('intimidad', 'sin-filtros', '¿Qué te gustaría probar pero te da vergüenza pedírmelo?'),
('intimidad', 'sin-filtros', '¿Hay algún tabú tuyo que te gustaría romper conmigo?'),
('intimidad', 'sin-filtros', '¿Qué objeto te gustaría que incorporáramos en nuestra intimidad?'),
('intimidad', 'sin-filtros', '¿Has tenido fantasías con alguien más estando conmigo? Sin nombres.'),
('intimidad', 'sin-filtros', '¿Qué te gustaría que yo te pidiera y nunca me atrevo?'),
('intimidad', 'sin-filtros', '¿Qué piensas de los tríos, parejas abiertas o swingers en nuestro caso?'),
('intimidad', 'sin-filtros', '¿Cuál es tu límite absoluto que nunca cruzarías ni por mí?');

-- ============================================================
-- RETOS
-- ============================================================
-- Suave
INSERT INTO questions (category, level, text) VALUES
('retos', 'suave', 'Dime tres cosas que admiras de mí, mirándome a los ojos sin reírte.'),
('retos', 'suave', 'Imita mi forma de andar.'),
('retos', 'suave', 'Hazme la mejor declaración de amor que se te ocurra en 30 segundos.'),
('retos', 'suave', 'Dame un beso que dure exactamente 10 segundos.'),
('retos', 'suave', 'Pon la canción que más te recuerda a mí y dime por qué.'),
('retos', 'suave', 'Háblame durante un minuto sin parar de lo que te gusta de mí.'),
('retos', 'suave', 'Cuéntame un chiste hasta que me haga reír.'),
('retos', 'suave', 'Hazme un masaje en la espalda durante una carta.'),
('retos', 'suave', 'Hazte un selfie raro conmigo y guárdalo.'),
('retos', 'suave', 'Inventa un apodo nuevo para mí ahora mismo.'),
('retos', 'suave', 'Dame un piropo que nunca me hayas dicho.'),
('retos', 'suave', 'Hazme una mini coreografía con la canción que suene primero en tu móvil.');

-- Picante
INSERT INTO questions (category, level, text) VALUES
('retos', 'picante', 'Bésame como me besabas al principio.'),
('retos', 'picante', 'Susúrrame al oído algo que me ponga nervios@.'),
('retos', 'picante', 'Quítame una prenda con los dientes.'),
('retos', 'picante', 'Hazme un masaje sin usar las manos durante 30 segundos.'),
('retos', 'picante', 'Dame un beso en el sitio que más te guste de mi cuerpo.'),
('retos', 'picante', 'Recréame nuestro primer beso paso a paso.'),
('retos', 'picante', 'Hazme un strip-tease de 30 segundos con la canción que tú elijas.'),
('retos', 'picante', 'Dame un beso prohibido (donde no nos hayamos besado nunca).'),
('retos', 'picante', 'Mírame fijamente 30 segundos sin reír y sin hablar.'),
('retos', 'picante', 'Hazme un baile sentad@ encima de mí durante una canción.'),
('retos', 'picante', 'Bésame sin usar los labios.'),
('retos', 'picante', 'Escríbeme con el dedo en la espalda algo que quieras que pase esta noche.');

-- Sin filtros
INSERT INTO questions (category, level, text) VALUES
('retos', 'sin-filtros', 'Quítame una prenda y la siguiente carta se juega sin ella.'),
('retos', 'sin-filtros', 'Hazme algo con la lengua durante 20 segundos donde tú elijas.'),
('retos', 'sin-filtros', 'Recréame tu fantasía favorita conmigo, sin palabras.'),
('retos', 'sin-filtros', 'Mándame ahora mismo el mensaje más subido de tono que se te ocurra.'),
('retos', 'sin-filtros', 'Bésame por el cuerpo durante un minuto entero sin parar.'),
('retos', 'sin-filtros', 'Dame las instrucciones exactas de cómo te gusta que te toque.'),
('retos', 'sin-filtros', 'Enséñame con tu cuerpo qué quieres que te haga después.'),
('retos', 'sin-filtros', 'Hazme un masaje sin ropa durante el tiempo de dos cartas.'),
('retos', 'sin-filtros', 'Bésame los labios mientras me dices al oído algo que te ponga.'),
('retos', 'sin-filtros', 'Hazme una foto subida de tono para guardar (y la borramos después).'),
('retos', 'sin-filtros', 'Atrévete a hacerme tu fantasía menos confesable durante 1 minuto.'),
('retos', 'sin-filtros', 'Quítame una prenda con los pies.');

-- ============================================================
-- ============================================================
-- CARTAS PARA PAREJAS QUE EMPIEZAN (audience = 'inicio')
-- 80 cartas: 5 categorías × (8 suave + 6 picante + 2 sin-filtros)
-- ============================================================
-- ============================================================

-- REVELACIONES · Suave (8)
INSERT INTO questions (category, level, text, audience) VALUES
('revelaciones', 'suave', '¿Cuál es el recuerdo más feliz que tienes de tu infancia?', 'inicio'),
('revelaciones', 'suave', '¿Qué te marcó más en la adolescencia?', 'inicio'),
('revelaciones', 'suave', '¿Cuál es el mejor regalo que has recibido y por qué?', 'inicio'),
('revelaciones', 'suave', '¿Qué cosa pequeña del día a día te hace feliz?', 'inicio'),
('revelaciones', 'suave', '¿Qué sueño de infancia te sigue rondando?', 'inicio'),
('revelaciones', 'suave', '¿Qué amistad de tu vida es la que más cuidas?', 'inicio'),
('revelaciones', 'suave', '¿Qué viaje cambió algo dentro de ti?', 'inicio'),
('revelaciones', 'suave', 'Cuéntame una manía o ritual tuyo que pocos conocen.', 'inicio');

-- REVELACIONES · Picante (6)
INSERT INTO questions (category, level, text, audience) VALUES
('revelaciones', 'picante', '¿Cuál ha sido tu mayor decepción amorosa hasta ahora?', 'inicio'),
('revelaciones', 'picante', '¿Qué es lo más impulsivo que has hecho por alguien?', 'inicio'),
('revelaciones', 'picante', '¿Qué inseguridad arrastras desde hace años?', 'inicio'),
('revelaciones', 'picante', '¿Qué cosa de tu pasado te cuesta contar y por qué?', 'inicio'),
('revelaciones', 'picante', '¿Cuál ha sido la mentira más grande que has contado en una relación?', 'inicio'),
('revelaciones', 'picante', '¿En qué momento de tu vida sentiste que tocabas fondo?', 'inicio');

-- REVELACIONES · Sin filtros (2)
INSERT INTO questions (category, level, text, audience) VALUES
('revelaciones', 'sin-filtros', '¿Qué relación tienes con tu ex más significativ@? ¿Habláis aún?', 'inicio'),
('revelaciones', 'sin-filtros', '¿Cuál es la pregunta sobre tu pasado que temes que te haga?', 'inicio');

-- COMPLICIDAD · Suave (8)
INSERT INTO questions (category, level, text, audience) VALUES
('complicidad', 'suave', '¿Cita ideal: en casa con manta o planazo fuera?', 'inicio'),
('complicidad', 'suave', '¿Eres más de playa o de montaña? Justifícalo.', 'inicio'),
('complicidad', 'suave', '¿Qué tres canciones tienen que estar sí o sí en una playlist nuestra?', 'inicio'),
('complicidad', 'suave', 'Café o té, dulce o salado, perro o gato. Defiéndelo.', 'inicio'),
('complicidad', 'suave', '¿Qué afición probarías por mí aunque no te llame nada?', 'inicio'),
('complicidad', 'suave', '¿Cuál es tu vicio confesable y vergonzoso (peli, serie, libro)?', 'inicio'),
('complicidad', 'suave', '¿Cuál es la mejor frase que te he dicho hasta ahora?', 'inicio'),
('complicidad', 'suave', '¿Qué tipo de humor te conquista de una persona?', 'inicio');

-- COMPLICIDAD · Picante (6)
INSERT INTO questions (category, level, text, audience) VALUES
('complicidad', 'picante', '¿En qué crees que somos opuestos y por qué te atrae?', 'inicio'),
('complicidad', 'picante', '¿Qué de mí te recuerda a alguien que ya quisiste?', 'inicio'),
('complicidad', 'picante', 'Si hubieras sabido todo de mí antes de empezar, ¿qué te habría hecho dudar?', 'inicio'),
('complicidad', 'picante', '¿Qué piensan tus amig@s de mí? Sé honest@.', 'inicio'),
('complicidad', 'picante', '¿En qué te sientes ya entendid@ por mí?', 'inicio'),
('complicidad', 'picante', '¿Qué de mi forma de ser te ha costado más asimilar?', 'inicio');

-- COMPLICIDAD · Sin filtros (2)
INSERT INTO questions (category, level, text, audience) VALUES
('complicidad', 'sin-filtros', '¿Qué de mí no le contarías a tu mejor amig@ y por qué?', 'inicio'),
('complicidad', 'sin-filtros', '¿Qué creías de mí antes de conocerme bien que ya has descartado?', 'inicio');

-- FUTURO · Suave (8)
INSERT INTO questions (category, level, text, audience) VALUES
('futuro', 'suave', '¿Qué te ilusiona más de seguir conociéndome?', 'inicio'),
('futuro', 'suave', '¿Qué plan quieres que hagamos antes de fin de mes?', 'inicio'),
('futuro', 'suave', '¿Qué ciudad te encantaría enseñarme?', 'inicio'),
('futuro', 'suave', '¿A qué edad te imaginabas teniendo una pareja seria?', 'inicio'),
('futuro', 'suave', '¿Qué quieres aprender en los próximos años?', 'inicio'),
('futuro', 'suave', '¿Qué viaje siempre has querido hacer y aún no has podido?', 'inicio'),
('futuro', 'suave', '¿Qué te gustaría que tuviéramos en común dentro de un año?', 'inicio'),
('futuro', 'suave', '¿Qué pequeño hábito te gustaría que adoptáramos juntos?', 'inicio');

-- FUTURO · Picante (6)
INSERT INTO questions (category, level, text, audience) VALUES
('futuro', 'picante', '¿Cuánto tiempo te lleva enamorarte de alguien?', 'inicio'),
('futuro', 'picante', '¿Qué señal te diría que esto va en serio?', 'inicio'),
('futuro', 'picante', '¿Cómo sabes cuándo es momento de cortar con alguien?', 'inicio'),
('futuro', 'picante', '¿Cuándo crees que diremos "te quiero" por primera vez?', 'inicio'),
('futuro', 'picante', '¿En qué somos compatibles y en qué nos va a costar?', 'inicio'),
('futuro', 'picante', '¿Qué red flags suele saltarse la gente y a ti no se te escapan?', 'inicio');

-- FUTURO · Sin filtros (2)
INSERT INTO questions (category, level, text, audience) VALUES
('futuro', 'sin-filtros', '¿Te ves casad@ o con hij@s? ¿En qué punto te imaginas eso conmigo?', 'inicio'),
('futuro', 'sin-filtros', 'Si todo va bien, ¿cómo imaginas el día que decidamos ser oficiales?', 'inicio');

-- INTIMIDAD · Suave (8)
INSERT INTO questions (category, level, text, audience) VALUES
('intimidad', 'suave', '¿Qué fue lo primero que te atrajo físicamente de mí?', 'inicio'),
('intimidad', 'suave', '¿Qué tipo de besos te enamoran más?', 'inicio'),
('intimidad', 'suave', '¿Cómo te gusta el primer abrazo del día?', 'inicio'),
('intimidad', 'suave', '¿Prefieres que te tomen la mano, que te abracen o que te besen la frente?', 'inicio'),
('intimidad', 'suave', '¿Cuándo te sentiste cómod@ siendo tú mism@ delante de mí?', 'inicio'),
('intimidad', 'suave', '¿Qué te transmite calma de estar conmigo?', 'inicio'),
('intimidad', 'suave', '¿Qué prenda mía es la que más te gusta?', 'inicio'),
('intimidad', 'suave', '¿En qué momento del día me echas más de menos?', 'inicio');

-- INTIMIDAD · Picante (6)
INSERT INTO questions (category, level, text, audience) VALUES
('intimidad', 'picante', '¿Cuándo te diste cuenta de que querías besarme?', 'inicio'),
('intimidad', 'picante', '¿Cómo recuerdas nuestro primer beso?', 'inicio'),
('intimidad', 'picante', '¿Qué imaginabas que pasaría conmigo antes de que pasara?', 'inicio'),
('intimidad', 'picante', '¿Qué tipo de caricia o roce te excita más?', 'inicio'),
('intimidad', 'picante', '¿Qué te gustaría que te dijera al oído la próxima vez?', 'inicio'),
('intimidad', 'picante', '¿Qué momento juntos repetirías exactamente igual?', 'inicio');

-- INTIMIDAD · Sin filtros (2)
INSERT INTO questions (category, level, text, audience) VALUES
('intimidad', 'sin-filtros', '¿Cuál es tu fantasía menos confesable que sí me contarías?', 'inicio'),
('intimidad', 'sin-filtros', '¿Qué te apetece que probemos juntos a la hora de la verdad?', 'inicio');

-- RETOS · Suave (8)
INSERT INTO questions (category, level, text, audience) VALUES
('retos', 'suave', 'Cuéntame algo de tu día con la voz de tu personaje favorito.', 'inicio'),
('retos', 'suave', 'Búscame tres GIFs que me describan.', 'inicio'),
('retos', 'suave', 'Enséñame una foto tuya de niñ@ y cuéntame la historia.', 'inicio'),
('retos', 'suave', 'Mírame a los ojos 20 segundos sin reír.', 'inicio'),
('retos', 'suave', 'Hazme reír en menos de un minuto sin hacer cosquillas.', 'inicio'),
('retos', 'suave', 'Cántame el estribillo de la última canción que escuchaste.', 'inicio'),
('retos', 'suave', 'Cuéntame tu mayor "fail" en una primera cita.', 'inicio'),
('retos', 'suave', 'Dame el mejor piropo que te hayan dicho en la vida.', 'inicio');

-- RETOS · Picante (6)
INSERT INTO questions (category, level, text, audience) VALUES
('retos', 'picante', 'Dame uno de tus mejores besos.', 'inicio'),
('retos', 'picante', 'Bésame en el cuello tres segundos sin reír.', 'inicio'),
('retos', 'picante', 'Susúrrame al oído tres cosas que te gustan de mí.', 'inicio'),
('retos', 'picante', 'Hazme un masaje en las manos durante una carta.', 'inicio'),
('retos', 'picante', 'Móntame un baile lento de 30 segundos.', 'inicio'),
('retos', 'picante', 'Dame un beso después de cada cumplido que te haga hasta el final de la partida.', 'inicio');

-- RETOS · Sin filtros (2)
INSERT INTO questions (category, level, text, audience) VALUES
('retos', 'sin-filtros', 'Quítame una prenda y guárdala como recuerdo de esta noche.', 'inicio'),
('retos', 'sin-filtros', 'Cuéntame con detalle qué te imaginas haciendo conmigo después de jugar.', 'inicio');

-- ============================================================
-- ETIQUETAS POR FRANJA DE EDAD
-- Por defecto todas las cartas son 'all'. Solo etiquetamos las
-- que tienen sesgo evidente: hijos, legado, GIFs, etc.
-- Franjas: '16-25', '26-40', '40+'
-- ============================================================

-- Cartas que asumen pareja con cierta historia o proyección larga
-- (50 años juntos, abuelos, dentro de 30 años, herencia) → no encajan para 16-25
UPDATE questions SET ages='26-40,40+' WHERE text IN (
    '¿Cómo celebraríamos nuestros 50 años juntos?',
    '¿Qué quieres que sigamos haciendo aunque seamos abuelos?',
    '¿Qué te gustaría que dijéramos al mirar atrás dentro de 30 años?',
    '¿Qué heredarías de mí si nos casáramos y luego me pasara algo?',
    '¿Cómo sería un fin de semana perfecto para nosotros dentro de 10 años?',
    '¿Dónde nos imaginas viviendo en 5 años?'
);

-- Decisiones de hijos: más relevantes en edad reproductiva
UPDATE questions SET ages='16-25,26-40' WHERE text IN (
    '¿Quieres tener hij@s conmigo? Sé sincer@.',
    '¿Te ves casad@ o con hij@s? ¿En qué punto te imaginas eso conmigo?'
);

-- Referencias culturales más juveniles (GIFs, "fail" en primera cita,
-- "a qué edad imaginabas tener pareja seria") → no encajan tanto en 40+
UPDATE questions SET ages='16-25,26-40' WHERE text IN (
    'Búscame tres GIFs que me describan.',
    '¿A qué edad te imaginabas teniendo una pareja seria?',
    'Cuéntame tu mayor "fail" en una primera cita.',
    'Cántame el estribillo de la última canción que escuchaste.'
);
