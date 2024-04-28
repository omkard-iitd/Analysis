with tracks as (
    select *
    from {{ ref('stg_music__track') }}
),

albums as (
    select *
    from {{ ref('stg_music__albums') }}
),

artists as (
    select *
    from {{ ref('stg_music__artists') }}
),

genres as (
    select *
    from {{ ref('stg_music__genre') }}
),

mediatypes as (
    select *
    from {{ ref('stg_music__mediatype') }}
)

select
    tracks.track_id,
    tracks.album_id,
    tracks.mediatype_id,
    tracks.genre_id,
    tracks.track_name,
    tracks.track_composer,
    albums.album_name,
    artists.artist_name,
    mediatypes.mediatype_name,
    genres.genre_name,
    tracks.track_length_ms,
    tracks.track_length_seconds,
    tracks.track_length_mins,
    tracks.bytes,
    tracks.unit_price
from tracks
    left join albums
        on tracks.album_id=albums.album_id
    left join artists 
        on albums.artist_id=artists.artist_id
    left join genres
        on tracks.genre_id=genres.genre_id
    left join mediatypes
        on tracks.mediatype_id=mediatypes.mediatype_id