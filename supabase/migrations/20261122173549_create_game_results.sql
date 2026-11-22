CREATE TABLE public.game_results (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    player_nickname text NOT NULL,
    puzzle_id text NOT NULL,
    elapsed_ms bigint NOT NULL,
    completed_at timestamptz NOT NULL DEFAULT now(),
    CONSTRAINT game_results_nickname_valid CHECK (
        char_length(player_nickname) BETWEEN 1 AND 30
        AND player_nickname !~ '^[[:space:]]|[[:space:]]$|[[:cntrl:]]'
    ),
    CONSTRAINT game_results_puzzle_id_valid CHECK (
        char_length(btrim(puzzle_id)) > 0
    ),
    CONSTRAINT game_results_elapsed_ms_positive CHECK (elapsed_ms > 0)
);

ALTER TABLE public.game_results ENABLE ROW LEVEL SECURITY;

REVOKE ALL ON TABLE public.game_results FROM PUBLIC, anon, authenticated;
GRANT SELECT ON TABLE public.game_results TO anon, authenticated;
GRANT INSERT (player_nickname, puzzle_id, elapsed_ms)
    ON TABLE public.game_results TO anon, authenticated;

CREATE POLICY game_results_public_read
    ON public.game_results
    FOR SELECT
    TO anon, authenticated
    USING (true);

CREATE POLICY game_results_public_insert
    ON public.game_results
    FOR INSERT
    TO anon, authenticated
    WITH CHECK (true);
