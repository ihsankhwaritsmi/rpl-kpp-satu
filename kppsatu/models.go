// Code generated by sqlc. DO NOT EDIT.
// versions:
//   sqlc v1.25.0

package kppsatu

import (
	"database/sql/driver"
	"fmt"
	"time"
)

type PaymentsPaymentmethod string

const (
	PaymentsPaymentmethodGopay PaymentsPaymentmethod = "Gopay"
	PaymentsPaymentmethodOvo   PaymentsPaymentmethod = "Ovo"
	PaymentsPaymentmethodDana  PaymentsPaymentmethod = "Dana"
)

func (e *PaymentsPaymentmethod) Scan(src interface{}) error {
	switch s := src.(type) {
	case []byte:
		*e = PaymentsPaymentmethod(s)
	case string:
		*e = PaymentsPaymentmethod(s)
	default:
		return fmt.Errorf("unsupported scan type for PaymentsPaymentmethod: %T", src)
	}
	return nil
}

type NullPaymentsPaymentmethod struct {
	PaymentsPaymentmethod PaymentsPaymentmethod
	Valid                 bool // Valid is true if PaymentsPaymentmethod is not NULL
}

// Scan implements the Scanner interface.
func (ns *NullPaymentsPaymentmethod) Scan(value interface{}) error {
	if value == nil {
		ns.PaymentsPaymentmethod, ns.Valid = "", false
		return nil
	}
	ns.Valid = true
	return ns.PaymentsPaymentmethod.Scan(value)
}

// Value implements the driver Valuer interface.
func (ns NullPaymentsPaymentmethod) Value() (driver.Value, error) {
	if !ns.Valid {
		return nil, nil
	}
	return string(ns.PaymentsPaymentmethod), nil
}

type Artist struct {
	Artistid       int32
	Artistname     string
	Artistemail    string
	Artistpassword string
	Bio            string
}

type Commission struct {
	Commissionid      int32
	ArtistArtistid    int32
	UserUserid        int32
	Commissiondetails string
	Commissiondate    time.Time
	Price             string
	Deadline          time.Time
}

type Payment struct {
	Paymentid     int32
	Commisionid   int32
	Paymentdate   time.Time
	Paymentamount string
	Paymentmethod PaymentsPaymentmethod
}

type User struct {
	Userid       int32
	Useremail    string
	Username     string
	Userpassword string
}
