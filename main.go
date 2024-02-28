package main

import (
	"context"
	"database/sql"
	"fmt"
	"log"
	"net/http"
	"strconv"
	"syscall"

	_ "github.com/go-sql-driver/mysql"
	"golang.org/x/term"
	sqlexport "kppsatu.sqlc.dev/app/kppsatu"
)

func main() {

	fmt.Print("Enter Password: ")
	bytePassword, err := term.ReadPassword(syscall.Stdin)
	if err != nil {
		fmt.Println("Error reading password:", err)
		return
	}
	password := string(bytePassword)
	fmt.Println("")

	if err := run(password); err != nil {
		log.Fatal(err)
	}

}

func run(passwd string) error {

	ctx := context.Background()
	dsn := fmt.Sprintf("root:%s@tcp(127.0.0.1:3306)/fiver", passwd)

	db, err := sql.Open("mysql", dsn)
	if err != nil {
		return err
	}

	queries := sqlexport.New(db)

	//Le all commission record:
	res, err := queries.AllCommissions(ctx)
	if err != nil {
		return err
	}
	fmt.Println(res)

	//Artits with at least one commission record:
	fmt.Println(queries.GetArtistNamesByCommissions(ctx))

	mux := http.NewServeMux()

	mux.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		http.ServeFile(w, r, "public/login.html")
	})

	mux.HandleFunc("/login", func(w http.ResponseWriter, r *http.Request) {
		if err := loginHandler(w, r, ctx, queries); err != nil {
			http.Error(w, err.Error(), http.StatusInternalServerError)
		}
	})

	mux.HandleFunc("/deleteUser", func(w http.ResponseWriter, r *http.Request) {
		if err := deleteUserHandler(w, r, ctx, queries); err != nil {
			http.Error(w, err.Error(), http.StatusInternalServerError)
		}
	})

	mux.HandleFunc("/register", func(w http.ResponseWriter, r *http.Request) {
		if err := registerHandler(w, r, ctx, queries); err != nil {
			http.Error(w, err.Error(), http.StatusInternalServerError)
		}
	})

	mux.HandleFunc("/updatePassword", func(w http.ResponseWriter, r *http.Request) {
		if err := updateUserPasswordHandler(w, r, ctx, queries); err != nil {
			http.Error(w, err.Error(), http.StatusInternalServerError)
		}
	})

	fmt.Println("Starting server on :8080...")
	http.ListenAndServe(":8080", mux)
	return nil
}

func loginHandler(w http.ResponseWriter, r *http.Request, ctx context.Context, queries *sqlexport.Queries) error {
	if r.Method != http.MethodPost {
		http.Error(w, "Hee Gabolee", http.StatusMethodNotAllowed)
	}

	loginType := r.FormValue("loginType")
	email := r.FormValue("email")
	password := r.FormValue("password")

	switch loginType {
	case "user":
		_, err := queries.UserLogin(ctx, sqlexport.UserLoginParams{
			Useremail:    email,
			Userpassword: password,
		})
		if err != nil {
			http.Redirect(w, r, "/", http.StatusSeeOther)
			return err
		}
		// log.Printf("ID:%d  Name:%s", res.Userid, res.Username)
		http.ServeFile(w, r, "public/userpage.html")
	case "artist":
		_, err := queries.ArtistLogin(ctx, sqlexport.ArtistLoginParams{
			Artistemail:    email,
			Artistpassword: password,
		})
		if err != nil {
			http.Redirect(w, r, "/", http.StatusSeeOther)
			return err
		}
		// log.Println(res)
		http.ServeFile(w, r, "public/artistpage.html")
	case "admin":
		if email != "admin@admin.com" || password != "admin" {
			http.Redirect(w, r, "/", http.StatusSeeOther)
			return fmt.Errorf("invalid credentials")
		} else {
			http.ServeFile(w, r, "public/admin.html")
		}
	default:
		http.Redirect(w, r, "/", http.StatusSeeOther)
	}
	return nil
}

func deleteUserHandler(w http.ResponseWriter, r *http.Request, ctx context.Context, queries *sqlexport.Queries) error {

	email := r.FormValue("email")

	err := queries.DeleteUser(ctx, email)
	if err != nil {
		http.Redirect(w, r, "/admin", http.StatusSeeOther)
		return err
	}
	return nil
}

func registerHandler(w http.ResponseWriter, r *http.Request, ctx context.Context, queries *sqlexport.Queries) error {
	email := r.FormValue("registerEmail")
	username := r.FormValue("registerUsername")
	password := r.FormValue("registerPassword")

	_, err := queries.RegisterUser(ctx, sqlexport.RegisterUserParams{
		Useremail:    email,
		Username:     username,
		Userpassword: password,
	})
	if err != nil {
		http.Redirect(w, r, "/", http.StatusSeeOther)
		return err
	}

	return nil
}

func updateUserPasswordHandler(w http.ResponseWriter, r *http.Request, ctx context.Context, queries *sqlexport.Queries) error {
	userID := r.FormValue("userID")
	newPassword := r.FormValue("newPassword")

	i, er := strconv.Atoi(userID)
	i32 := int32(i)
	if er != nil {
		panic(er)
	}
	err := queries.UpdateUserPassword(ctx, sqlexport.UpdateUserPasswordParams{
		Userid:       i32,
		Userpassword: newPassword,
	})
	if err != nil {
		http.Redirect(w, r, "/", http.StatusSeeOther)
		return err
	}
	return nil
}
