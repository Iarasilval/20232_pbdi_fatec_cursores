DO $$
DECLARE
    cur_top_youtubers CURSOR FOR
        SELECT rank, youtuber
        FROM tb_top_youtubers
        WHERE video_count >= 1000
          AND (category = 'Sports' OR category = 'Music');
    v_rank INT;
    v_youtuber VARCHAR(200);
BEGIN
    OPEN cur_top_youtubers;
    LOOP
        FETCH cur_top_youtubers INTO v_rank, v_youtuber;
        EXIT WHEN NOT FOUND;
        RAISE NOTICE 'Rank: %, Youtuber: %', v_rank, v_youtuber;
    END LOOP;
    CLOSE cur_top_youtubers;
END;
$$


-- DO $$
-- DECLARE 
-- 	--1. declaração do cursor
-- 	cur_nomes_youtubers REFCURSOR; -- não vinculador 
-- 	-- para armazenar o nome da vez 
-- 	v_youtuber VARCHAR(200);
-- BEGIN
-- 	--2. Abertura do cursor
-- 	OPEN cur_nomes_youtubers FOR
-- 		SELECT youtuber
-- 		FROM 
-- 		tb_top_youtubers;
-- 	LOOP
-- 		--3. Recuperação dos dados de interesse
-- 		FETCH cur_nomes_youtubers INTO v_youtuber;
-- 		-- Variável especial: FOUND 
-- 		EXIT WHEN NOT FOUND;
-- 		RAISE NOTICE 'Nome: %', v_youtuber;		
-- 	END LOOP;
-- 	--4. FEchar o cursor 
-- 	CLOSE cur_nomes_youtubers;
-- END;
-- $$


-- SELECT * FROM tb_top_youtubers
-- LIMIT 50;

-- CREATE TABLE tb_top_youtubers(
-- 	cod_top_youtubers SERIAL PRIMARY KEY,
-- 	rank INT,
-- 	youtuber VARCHAR(200),
-- 	subscribers INT,
-- 	video_views VARCHAR(200),
-- 	video_count INT,
-- 	category VARCHAR(200),
-- 	started INT
-- );