class KaraokeSong {
  int id;
  String code;
  String title;
  String title_simple;
  String title_short;
  String lyric;
  String lyric_simple;
  int brand_id;
  String brand_text;
  int vol;
  String lang;
  String author;
  int favorite;
  String author_simple;
  String artist;
  String artist_simple;

  KaraokeSong(
      this.id,
      this.code,
      this.title,
      this.title_simple,
      this.title_short,
      this.lyric,
      this.lyric_simple,
      this.brand_id,
      this.brand_text,
      this.vol,
      this.lang,
      this.author,
      this.favorite,
      this.author_simple,
      this.artist,
      this.artist_simple);

  KaraokeSong.fromMap(Map m) {
    id = m["id"];
    code = m["code"];
    title = m["title"];
    title_simple = m["title_simple"];
    title_short = m["title_short"];
    lyric = m["lyric"];
    lyric_simple = m["lyric_simple"];
    brand_id = m["brand_id"];
    brand_text = m["brand_text"];
    vol = m["vol"];
    lang = m["lang"];
    author = m["author"];
    favorite = m["favorite"];
    author_simple = m["author_simple"];
    artist = m["artist"];
    artist_simple = m["artist_simple"];
  }
}
