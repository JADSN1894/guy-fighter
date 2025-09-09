//https://www.imagineforest.com/blog/funny-name-generator/

use rand::{distr::Uniform, Rng};

pub const FIRST_NAMES: [&str; 50] = [
    "Terge", "Zoowee", "Fluffy", "Buritt", "Peaberry",
    "Trashwee", "Flapberry", "Gummoo", "Humster", "Burberry",
    "Slugtu", "Bofy", "Sniffpants", "Stinkmoo", "Barfberry",
    "Barfaboo", "Wormbag", "Peaster", "Figitt", "Subo",
    "Pea-a-boo", "Zoobuns", "Foobug", "Peamoo", "Ratbuns",
    "Madaloo", "Peabs", "Bushbo", "Binfy", "Bittyspitz",
    "Fartmoo", "Binpants", "Chewspitz", "Gootu", "Bobuns",
    "Pooritt", "Stinkwee", "Chewitt", "Snortu", "Fartaloo",
    "Bugbee", "Poopfy", "Zoozy", "Trashbug", "Peaman",
    "Stinkbuns", "Bittypants", "Bugeenie", "Dingbs", "Snabster"
];

pub const LAST_NAMES: [&str; 50] = [
    "Sternherd", "Blubberworth", "Gloomkins", "Noseface", "Wigglewhistle",
    "Sockborn", "Fudgewhistle", "Hooperbottom", "Pottyworthy", "Gloomhall",
    "Hooperseed", "Gloomman", "Pimplehill", "Snotsniff", "Oinkhill",
    "Roachson", "Chewface", "Beeman", "Tootson", "Doozyton",
    "Moanihill", "Sockball", "Swamprider", "Fudgehill", "Wigglefish",
    "Snotseed", "Blubberseed", "Tootbean", "Moanigold", "Boogerfeet",
    "PimpleFadden", "Noodlefeet", "Snotborn", "Messyhall", "Pimplehill",
    "Woofhair", "Goatbottom", "Pottybag", "Madborn", "Roachhall",
    "Noseson", "Chewbrain", "Beaniehall", "Messyhall", "Oinkson",
    "Spottygold", "Messyrider", "Roachson", "Moonbean", "Toothill"
];

pub fn generate_name() -> String {

    let mut thread_rng = rand::rng(); 
    let random = thread_rng.sample(Uniform::new_inclusive(0, FIRST_NAMES.len()).unwrap());

    let first_name = FIRST_NAMES[random];
    let last_name = LAST_NAMES[random];

    format!("{} {}", first_name, last_name)
}