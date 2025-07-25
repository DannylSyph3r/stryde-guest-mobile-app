import 'package:fpdart/fpdart.dart';
import 'package:stryde_guest_app/utils/failure.dart';

//! FUTURE EITHER, IS A CUSTOM TYPE DEF.
//! IT EQUATES A FUTURE OF TYPE EITHER, WHERE EITHER IS A CUSTOM TYPE DEF THAT RETURNS FAILURE RESPONSE ON THE LEFT AND SUCCESS ON THE RIGHT.
//! FAILURE TYPE HAS BEEN CUSTOM DEFINED TO RETURN JUST THE FAILURE MESSAGE.
//! SUCCESS TYPE IS DEPENDENT ON DEVELOPER DEFINITION. IT CAN BE AN INT, A BOOL OR WHATEVER.
typedef FutureEither<SuccessType> = Future<Either<Failure, SuccessType>>;

//! SIMPLE FUTURE OF TYPE VOID RETURNING A CUSTOM FUTURE EITHER OF TYPE VOID I.E
//! REGULAR FUTURE THAT RETURNS NOTHING.
typedef FutureVoid = FutureEither<void>;

//! ENUM FOR NOTIFICATION TYPE
enum NotificationType { success, failure, info }

//! ENUM FOR VERIFICATION STATUS BADGE
enum VerificationStatus { verified, rejected, notStarted, pending }

//! ENUM FOR TRANSACTION CLASS
enum TransactionClass { credit, debit }

//! ENUM FOR NOTIFICATIONS
//! - TRANSFER IN AND TRANSFER OUT - THESE HANDLE TRANSFERS BY USER TAG - WITHIN THE WALLET
//! - WITHDRAWAL - SENDING MONEY TO ANOTHER USERS BANK ACCOUNT.
//! - FUNDING CREDIT FROM OUTSIDE OF RETRO WALLET WALLET
enum NotificationItemType { transferIn, transferOut, withdrawal, funding }

//! AUTHENTICATION RESULT - USED TO MANAGE APP AUTHENTICATION STATE
enum AuthResult { success, failure }

//! ENUM FOR CONNECTIVITY STATUS
enum ConnectivityStatus { wifi, mobile, online, offline }