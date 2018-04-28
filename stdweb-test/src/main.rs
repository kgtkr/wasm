#[macro_use]
extern crate stdweb;

fn main() {
    stdweb::initialize();

    let message = "はろはろ1";
    js! {
        console.log( @{message} );
    }

    stdweb::event_loop();
}
