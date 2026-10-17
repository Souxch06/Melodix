.class public final Lcc2;
.super Ls0;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcc2;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final j:Z

.field public final k:Ljava/lang/String;

.field public final l:I

.field public final m:I

.field public final n:J


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lya2;

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    invoke-direct {v0, v1}, Lya2;-><init>(I)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcc2;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(ZLjava/lang/String;IIJ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-boolean p1, p0, Lcc2;->j:Z

    .line 5
    .line 6
    iput-object p2, p0, Lcc2;->k:Ljava/lang/String;

    .line 7
    .line 8
    invoke-static {p3}, Lkp1;->k(I)I

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    add-int/lit8 p1, p1, -0x1

    .line 13
    .line 14
    iput p1, p0, Lcc2;->l:I

    .line 15
    .line 16
    invoke-static {p4}, Lju1;->y(I)I

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    add-int/lit8 p1, p1, -0x1

    .line 21
    .line 22
    iput p1, p0, Lcc2;->m:I

    .line 23
    .line 24
    iput-wide p5, p0, Lcc2;->n:J

    .line 25
    .line 26
    return-void
.end method


# virtual methods
.method public final writeToParcel(Landroid/os/Parcel;I)V
    .locals 3

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
    const/4 v1, 0x4

    .line 9
    invoke-static {p1, v0, v1}, Lbe2;->J(Landroid/os/Parcel;II)V

    .line 10
    .line 11
    .line 12
    iget-boolean v0, p0, Lcc2;->j:Z

    .line 13
    .line 14
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 15
    .line 16
    .line 17
    const/4 v0, 0x2

    .line 18
    iget-object v2, p0, Lcc2;->k:Ljava/lang/String;

    .line 19
    .line 20
    invoke-static {p1, v0, v2}, Lbe2;->F(Landroid/os/Parcel;ILjava/lang/String;)V

    .line 21
    .line 22
    .line 23
    const/4 v0, 0x3

    .line 24
    invoke-static {p1, v0, v1}, Lbe2;->J(Landroid/os/Parcel;II)V

    .line 25
    .line 26
    .line 27
    iget v0, p0, Lcc2;->l:I

    .line 28
    .line 29
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 30
    .line 31
    .line 32
    invoke-static {p1, v1, v1}, Lbe2;->J(Landroid/os/Parcel;II)V

    .line 33
    .line 34
    .line 35
    iget v0, p0, Lcc2;->m:I

    .line 36
    .line 37
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 38
    .line 39
    .line 40
    const/16 v0, 0x8

    .line 41
    .line 42
    const/4 v1, 0x5

    .line 43
    invoke-static {p1, v1, v0}, Lbe2;->J(Landroid/os/Parcel;II)V

    .line 44
    .line 45
    .line 46
    iget-wide v0, p0, Lcc2;->n:J

    .line 47
    .line 48
    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    .line 49
    .line 50
    .line 51
    invoke-static {p1, p2}, Lbe2;->N(Landroid/os/Parcel;I)V

    .line 52
    .line 53
    .line 54
    return-void
.end method
