let
    name = "SoumyabrataBanik";
    email = "soumyabratabanik46@gmail.com";
in
{
    programs.git = {
        enable = true;
        userName = name;
        userEmail = email;
    };
}
