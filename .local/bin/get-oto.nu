#!/usr/bin/env nu

const ARTISTS: string = "Kenji Sekiguchi & Nhato";
const ARTIST: string = "Otographic Music";
const TITLE: string = "Otographic Arts";

def main [url: string] {
  let info = yt-dlp -j $url | from json;
  let title = $info.fulltitle;  
  let date = extract_date $title;
  let track_no = extract_track_no $title;

  let final_title = $"($ARTISTS) - ($TITLE) ($track_no).mp3";

  download $url $final_title;

  set_metadata $url $final_title $track_no $date;
}

def set_metadata [url: string, final_title: string, track_no: string, date: datetime] {
  let date_fmt = $date | format date "%d-%m-%Y";
  let year = $date | format date "%Y";

  id3v2 --TIT2 $"($TITLE) - ($track_no) ($date_fmt)" $final_title;
  id3v2 --TPE1 $"($ARTISTS)" $final_title;
  id3v2 --TALB $"($TITLE)" $final_title;
  id3v2 --TRCK $track_no $final_title;
  id3v2 --WOAF $"($url)" $final_title;
  id3v2 --TDAT $"($date_fmt)" $final_title;
  id3v2 --TYER $year $final_title;
}

def extract_track_no [title: string] {
  $title | split words | reverse | get 3
}

def extract_date [title: string] {
  let split = $title | split words | reverse;
  let d = $split | get 0;
  let m = $split | get 1;
  let y = $split | get 2;

  $"($y)-($m)-($d)" | date from-human 
}

def download [url: string, final_title: string] {
  yt-dlp $url -f bestaudio -x --audio-format mp3 --audio-quality 0 --embed-thumbnail -o $final_title;
}
