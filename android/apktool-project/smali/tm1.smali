.class public final Ltm1;
.super Ls0;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Ltm1;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final j:I

.field public final k:Landroid/accounts/Account;

.field public final l:I

.field public final m:Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lom1;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-direct {v0, v1}, Lom1;-><init>(I)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Ltm1;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(ILandroid/accounts/Account;ILcom/google/android/gms/auth/api/signin/GoogleSignInAccount;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ltm1;->j:I

    .line 5
    .line 6
    iput-object p2, p0, Ltm1;->k:Landroid/accounts/Account;

    .line 7
    .line 8
    iput p3, p0, Ltm1;->l:I

    .line 9
    .line 10
    iput-object p4, p0, Ltm1;->m:Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final writeToParcel(Landroid/os/Parcel;I)V
    .locals 4

    .line 1
    const/16 v0, 0x4f45

    .line 2
    .line 3
    invoke-static {p1, v0}, Lbe2;->L(Landroid/os/Parcel;I)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x1

    .line 8
    const/4 v2, 0x4

    .line 9
    invoke-static {p1, v1, v2}, Lbe2;->J(Landroid/os/Parcel;II)V

    .line 10
    .line 11
    .line 12
    iget v1, p0, Ltm1;->j:I

    .line 13
    .line 14
    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeInt(I)V

    .line 15
    .line 16
    .line 17
    const/4 v1, 0x2

    .line 18
    iget-object v3, p0, Ltm1;->k:Landroid/accounts/Account;

    .line 19
    .line 20
    invoke-static {p1, v1, v3, p2}, Lbe2;->E(Landroid/os/Parcel;ILandroid/os/Parcelable;I)V

    .line 21
    .line 22
    .line 23
    const/4 v1, 0x3

    .line 24
    invoke-static {p1, v1, v2}, Lbe2;->J(Landroid/os/Parcel;II)V

    .line 25
    .line 26
    .line 27
    iget v1, p0, Ltm1;->l:I

    .line 28
    .line 29
    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeInt(I)V

    .line 30
    .line 31
    .line 32
    iget-object p0, p0, Ltm1;->m:Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;

    .line 33
    .line 34
    invoke-static {p1, v2, p0, p2}, Lbe2;->E(Landroid/os/Parcel;ILandroid/os/Parcelable;I)V

    .line 35
    .line 36
    .line 37
    invoke-static {p1, v0}, Lbe2;->N(Landroid/os/Parcel;I)V

    .line 38
    .line 39
    .line 40
    return-void
.end method
