.class public final Lt92;
.super Ls0;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lt92;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final j:J

.field public k:[B

.field public final l:Ljava/lang/String;

.field public final m:Landroid/os/Bundle;

.field public final n:I

.field public final o:J

.field public p:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lom1;

    .line 2
    .line 3
    const/16 v1, 0x1b

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lom1;-><init>(I)V

    .line 6
    .line 7
    .line 8
    sput-object v0, Lt92;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 9
    .line 10
    return-void
.end method

.method public constructor <init>(J[BLjava/lang/String;Landroid/os/Bundle;IJLjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-wide p1, p0, Lt92;->j:J

    .line 5
    .line 6
    iput-object p3, p0, Lt92;->k:[B

    .line 7
    .line 8
    iput-object p4, p0, Lt92;->l:Ljava/lang/String;

    .line 9
    .line 10
    iput-object p5, p0, Lt92;->m:Landroid/os/Bundle;

    .line 11
    .line 12
    iput p6, p0, Lt92;->n:I

    .line 13
    .line 14
    iput-wide p7, p0, Lt92;->o:J

    .line 15
    .line 16
    iput-object p9, p0, Lt92;->p:Ljava/lang/String;

    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public final writeToParcel(Landroid/os/Parcel;I)V
    .locals 4

    .line 1
    const/16 p2, 0x4f45

    .line 2
    .line 3
    invoke-static {p1, p2}, Lbe2;->L(Landroid/os/Parcel;I)I

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    const/4 v0, 0x1

    .line 8
    const/16 v1, 0x8

    .line 9
    .line 10
    invoke-static {p1, v0, v1}, Lbe2;->J(Landroid/os/Parcel;II)V

    .line 11
    .line 12
    .line 13
    iget-wide v2, p0, Lt92;->j:J

    .line 14
    .line 15
    invoke-virtual {p1, v2, v3}, Landroid/os/Parcel;->writeLong(J)V

    .line 16
    .line 17
    .line 18
    const/4 v0, 0x2

    .line 19
    iget-object v2, p0, Lt92;->k:[B

    .line 20
    .line 21
    invoke-static {p1, v0, v2}, Lbe2;->A(Landroid/os/Parcel;I[B)V

    .line 22
    .line 23
    .line 24
    const/4 v0, 0x3

    .line 25
    iget-object v2, p0, Lt92;->l:Ljava/lang/String;

    .line 26
    .line 27
    invoke-static {p1, v0, v2}, Lbe2;->F(Landroid/os/Parcel;ILjava/lang/String;)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lt92;->m:Landroid/os/Bundle;

    .line 31
    .line 32
    const/4 v2, 0x4

    .line 33
    invoke-static {p1, v2, v0}, Lbe2;->z(Landroid/os/Parcel;ILandroid/os/Bundle;)V

    .line 34
    .line 35
    .line 36
    const/4 v0, 0x5

    .line 37
    invoke-static {p1, v0, v2}, Lbe2;->J(Landroid/os/Parcel;II)V

    .line 38
    .line 39
    .line 40
    iget v0, p0, Lt92;->n:I

    .line 41
    .line 42
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 43
    .line 44
    .line 45
    const/4 v0, 0x6

    .line 46
    invoke-static {p1, v0, v1}, Lbe2;->J(Landroid/os/Parcel;II)V

    .line 47
    .line 48
    .line 49
    iget-wide v0, p0, Lt92;->o:J

    .line 50
    .line 51
    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    .line 52
    .line 53
    .line 54
    const/4 v0, 0x7

    .line 55
    iget-object p0, p0, Lt92;->p:Ljava/lang/String;

    .line 56
    .line 57
    invoke-static {p1, v0, p0}, Lbe2;->F(Landroid/os/Parcel;ILjava/lang/String;)V

    .line 58
    .line 59
    .line 60
    invoke-static {p1, p2}, Lbe2;->N(Landroid/os/Parcel;I)V

    .line 61
    .line 62
    .line 63
    return-void
.end method
