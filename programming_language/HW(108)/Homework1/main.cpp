#include <nana/gui.hpp>
#include <nana/gui/widgets/label.hpp>
#include <nana/gui/widgets/button.hpp>

int main()
{
    using namespace nana;

    //Define a form.
    form fm;

    //Define a label and display a text.
    label lab{fm, "Hello, <bold blue size=16>Nana C++ Library</>"};
    lab.format(true);

    //Define a button and answer the click event.
    button btn{fm, "Quit"};
    btn.events().click([&fm]{
        fm.close();
    });

    //Layout management
    fm.div("vert <><<><weight=80% text><>><><weight=24<><button><>><>");
    fm["text"]<<lab;
    fm["button"] << btn;
    fm.collocate();
	
	fm.events().unload([](const arg_unload& arg){
		msgbox mb(arg.window_handle,u8"Exit", msgbox::yes_no);
		mb.icon(mb.icon_question);
		mb << u8"Do you want to quit?";
		arg.cancel = (mb.show() != msgbox::pick_yes);
	});
	
    //Show the form
    fm.show();

    //Start to event loop process, it blocks until the form is closed.
    exec();
}