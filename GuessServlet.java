package guessservlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

//@WebServlet("/GuessServlet") // This maps the servlet to /GuessServlet
public class GuessServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    int numberToGuess = (int) (Math.random() * 100 + 1);
    int attempts = 0;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int guess = Integer.parseInt(request.getParameter("guess"));
        attempts++;
        String message = "";
        String imageUrl = "";

        if (guess < numberToGuess) {
            message = "Too Low!";
        } else if (guess > numberToGuess) {
            message = "Too High!";
        } else {
            message = "You Win!🎉 Attempts: " + attempts;
            imageUrl = "<img src='https://png.pngtree.com/png-vector/20220525/ourmid/pngtree-comic-speech-bubbles-with-text-you-win-png-image_4729144.png' width='200'>";
            attempts = 0;
            numberToGuess = (int) (Math.random() * 100 + 1); // reset
        }

        if (attempts >= 5 && guess != numberToGuess) {
            message = "You Lost!💀 The number was " + numberToGuess;
            imageUrl = "<img src='https://img.freepik.com/premium-vector/you-lose-comic-speech-bubble-cartoon-game-assets_1056-3237.jpg' width='200'>";
            attempts = 0;
            numberToGuess = (int) (Math.random() * 100 + 1); // reset
        }

        request.setAttribute("message", message);
        request.setAttribute("image", imageUrl);
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
}
