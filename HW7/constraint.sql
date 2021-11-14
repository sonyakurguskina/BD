ALTER TABLE label ADD CHECK (name != 'Vertigo');
ALTER TABLE label ADD CHECK (char_length(name) > 1);
ALTER TABLE producer ADD CHECK (char_length(name) > 3);
ALTER TABLE producer ADD CHECK (char_length(lastname) > 2);
ALTER TABLE artist ADD CHECK (char_length(name) > 3);
ALTER TABLE song ADD CHECK (char_length(name) > 2);



CREATE TABLE IF NOT EXISTS public.album
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT album_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE public.album
    OWNER to postgres;
	
	
	
CREATE TABLE IF NOT EXISTS public.artist
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT artist_pkey PRIMARY KEY (id),
    CONSTRAINT artist_name_check CHECK (char_length(name::text) > 3)
)

TABLESPACE pg_default;

ALTER TABLE public.artist
    OWNER to postgres;
	
	
	
CREATE TABLE IF NOT EXISTS public.genre
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT genre_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE public.genre
    OWNER to postgres;
	
	
	
CREATE TABLE IF NOT EXISTS public.label
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    participant character varying(255) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT label_pkey PRIMARY KEY (id),
    CONSTRAINT label_name_check CHECK (name::text <> 'Vertigo'::text),
    CONSTRAINT label_name_check1 CHECK (char_length(name::text) > 1)
)

TABLESPACE pg_default;

ALTER TABLE public.label
    OWNER to postgres;
	


CREATE TABLE IF NOT EXISTS public.producer
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    lastname character varying(255) COLLATE pg_catalog."default" NOT NULL,
    country character varying(255) COLLATE pg_catalog."default" NOT NULL,
    label_id integer,
    CONSTRAINT producer_pkey PRIMARY KEY (id),
    CONSTRAINT producer_fk FOREIGN KEY (label_id)
        REFERENCES public.label (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT producer_name_check CHECK (char_length(name::text) > 3),
    CONSTRAINT producer_lastname_check CHECK (char_length(lastname::text) > 2)
)

TABLESPACE pg_default;

ALTER TABLE public.producer
    OWNER to postgres;
	
	

CREATE TABLE IF NOT EXISTS public.song
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    artist_id integer,
    producer_id integer,
    album_id integer,
    CONSTRAINT song_pkey PRIMARY KEY (id),
    CONSTRAINT song_fk FOREIGN KEY (artist_id)
        REFERENCES public.artist (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT song_fk1 FOREIGN KEY (producer_id)
        REFERENCES public.producer (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT song_fk2 FOREIGN KEY (album_id)
        REFERENCES public.album (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT song_name_check CHECK (char_length(name::text) > 2)
)

TABLESPACE pg_default;

ALTER TABLE public.song
    OWNER to postgres;	