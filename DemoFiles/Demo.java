import java.util.Scanner;
import java.util.Stack;

public class Main {
    // Function to check if the given character is an operator
    private static boolean isOperator(char c) {
        return c == '+' || c == '-' || c == '*' || c == '/' || c == '%' || c == '^';
    }

    // Function to get precedence of operators
    private static int precedence(char operator) {
        switch (operator) {
            case '+':
            case '-':
                return 1;
            case '*':
            case '/':
                return 2;
            case '%':
                return 3;
            case '^':
                return 4;
            default:
                return 0;
        }
    }

    // Function to convert infix expression to postfix expression
    private static String infixToPostfix(String expression) {
        StringBuilder postfix = new StringBuilder();
        Stack<Character> stack = new Stack<>();

        System.out.println("TOKEN (X)\tSTACK (Y)\tOUTPUT (POSTFIX)");

        for (char c : expression.toCharArray()) {
            if (Character.isLetterOrDigit(c)) {
                postfix.append(c);
                System.out.println(c + "\t\t" + stackRepresentation(stack) + "\t\t" + postfix.toString());
            } else if (c == '(') {
                stack.push(c);
                System.out.println(c + "\t\t" + stackRepresentation(stack) + "\t\t" + postfix.toString());
            } else if (c == ')') {
                while (!stack.isEmpty() && stack.peek() != '(') {
                    postfix.append(stack.pop());
                }
                stack.pop(); // Pop '('
                System.out.println(c + "\t\t" + stackRepresentation(stack) + "\t\t" + postfix.toString());
            } else if (isOperator(c)) {
                while (!stack.isEmpty() && precedence(stack.peek()) >= precedence(c)) {
                    postfix.append(stack.pop());
                }
                stack.push(c);
                System.out.println(c + "\t\t" + stackRepresentation(stack) + "\t\t" + postfix.toString());
            }
        }

        // Pop remaining operators from stack
        while (!stack.isEmpty()) {
            postfix.append(stack.pop());
        }
        
        // Print the final postfix expression
        System.out.println("#" + "\t\t" + stackRepresentation(stack) + "\t\t" + postfix.toString());

        return postfix.toString();
    }
    
    // Function to represent stack contents with '#' symbol
    private static String stackRepresentation(Stack<Character> stack) {
        StringBuilder representation = new StringBuilder("#");
        for (Character ch : stack) {
            representation.append(ch);
        }
        return representation.toString();
    }

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        while (true) {
            System.out.print("Enter infix expression: ");
            String infixExpression = scanner.nextLine();
            String postfixExpression = infixToPostfix(infixExpression);
            System.out.println("E = " + postfixExpression);

            System.out.print("Do you want to try again? (yes/no): ");
            String choice = scanner.nextLine();
            if (!choice.equalsIgnoreCase("yes")) {
                break;
            }
        }
        scanner.close();
    }
}
