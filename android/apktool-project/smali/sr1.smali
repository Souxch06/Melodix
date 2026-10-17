.class public final Lsr1;
.super Ls0;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lsr1;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public j:Ljava/lang/String;

.field public k:Ljava/lang/String;

.field public l:Lwa2;

.field public m:J

.field public n:Z

.field public o:Ljava/lang/String;

.field public final p:Ltu1;

.field public q:J

.field public r:Ltu1;

.field public final s:J

.field public final t:Ltu1;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lom1;

    .line 2
    .line 3
    const/4 v1, 0x6

    .line 4
    invoke-direct {v0, v1}, Lom1;-><init>(I)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lsr1;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Lwa2;JZLjava/lang/String;Ltu1;JLtu1;JLtu1;)V
    .locals 0

    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    iput-object p1, p0, Lsr1;->j:Ljava/lang/String;

    iput-object p2, p0, Lsr1;->k:Ljava/lang/String;

    iput-object p3, p0, Lsr1;->l:Lwa2;

    iput-wide p4, p0, Lsr1;->m:J

    iput-boolean p6, p0, Lsr1;->n:Z

    iput-object p7, p0, Lsr1;->o:Ljava/lang/String;

    iput-object p8, p0, Lsr1;->p:Ltu1;

    iput-wide p9, p0, Lsr1;->q:J

    iput-object p11, p0, Lsr1;->r:Ltu1;

    iput-wide p12, p0, Lsr1;->s:J

    iput-object p14, p0, Lsr1;->t:Ltu1;

    return-void
.end method

.method public constructor <init>(Lsr1;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Lbh;->h(Ljava/lang/Object;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p1, Lsr1;->j:Ljava/lang/String;

    .line 8
    .line 9
    iput-object v0, p0, Lsr1;->j:Ljava/lang/String;

    .line 10
    .line 11
    iget-object v0, p1, Lsr1;->k:Ljava/lang/String;

    .line 12
    .line 13
    iput-object v0, p0, Lsr1;->k:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v0, p1, Lsr1;->l:Lwa2;

    .line 16
    .line 17
    iput-object v0, p0, Lsr1;->l:Lwa2;

    .line 18
    .line 19
    iget-wide v0, p1, Lsr1;->m:J

    .line 20
    .line 21
    iput-wide v0, p0, Lsr1;->m:J

    .line 22
    .line 23
    iget-boolean v0, p1, Lsr1;->n:Z

    .line 24
    .line 25
    iput-boolean v0, p0, Lsr1;->n:Z

    .line 26
    .line 27
    iget-object v0, p1, Lsr1;->o:Ljava/lang/String;

    .line 28
    .line 29
    iput-object v0, p0, Lsr1;->o:Ljava/lang/String;

    .line 30
    .line 31
    iget-object v0, p1, Lsr1;->p:Ltu1;

    .line 32
    .line 33
    iput-object v0, p0, Lsr1;->p:Ltu1;

    .line 34
    .line 35
    iget-wide v0, p1, Lsr1;->q:J

    .line 36
    .line 37
    iput-wide v0, p0, Lsr1;->q:J

    .line 38
    .line 39
    iget-object v0, p1, Lsr1;->r:Ltu1;

    .line 40
    .line 41
    iput-object v0, p0, Lsr1;->r:Ltu1;

    .line 42
    .line 43
    iget-wide v0, p1, Lsr1;->s:J

    .line 44
    .line 45
    iput-wide v0, p0, Lsr1;->s:J

    .line 46
    .line 47
    iget-object p1, p1, Lsr1;->t:Ltu1;

    .line 48
    .line 49
    iput-object p1, p0, Lsr1;->t:Ltu1;

    .line 50
    .line 51
    return-void
.end method


# virtual methods
.method public final writeToParcel(Landroid/os/Parcel;I)V
    .locals 6

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
    const/4 v1, 0x2

    .line 8
    iget-object v2, p0, Lsr1;->j:Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {p1, v1, v2}, Lbe2;->F(Landroid/os/Parcel;ILjava/lang/String;)V

    .line 11
    .line 12
    .line 13
    const/4 v1, 0x3

    .line 14
    iget-object v2, p0, Lsr1;->k:Ljava/lang/String;

    .line 15
    .line 16
    invoke-static {p1, v1, v2}, Lbe2;->F(Landroid/os/Parcel;ILjava/lang/String;)V

    .line 17
    .line 18
    .line 19
    iget-object v1, p0, Lsr1;->l:Lwa2;

    .line 20
    .line 21
    const/4 v2, 0x4

    .line 22
    invoke-static {p1, v2, v1, p2}, Lbe2;->E(Landroid/os/Parcel;ILandroid/os/Parcelable;I)V

    .line 23
    .line 24
    .line 25
    iget-wide v3, p0, Lsr1;->m:J

    .line 26
    .line 27
    const/4 v1, 0x5

    .line 28
    const/16 v5, 0x8

    .line 29
    .line 30
    invoke-static {p1, v1, v5}, Lbe2;->J(Landroid/os/Parcel;II)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p1, v3, v4}, Landroid/os/Parcel;->writeLong(J)V

    .line 34
    .line 35
    .line 36
    iget-boolean v1, p0, Lsr1;->n:Z

    .line 37
    .line 38
    const/4 v3, 0x6

    .line 39
    invoke-static {p1, v3, v2}, Lbe2;->J(Landroid/os/Parcel;II)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeInt(I)V

    .line 43
    .line 44
    .line 45
    const/4 v1, 0x7

    .line 46
    iget-object v2, p0, Lsr1;->o:Ljava/lang/String;

    .line 47
    .line 48
    invoke-static {p1, v1, v2}, Lbe2;->F(Landroid/os/Parcel;ILjava/lang/String;)V

    .line 49
    .line 50
    .line 51
    iget-object v1, p0, Lsr1;->p:Ltu1;

    .line 52
    .line 53
    invoke-static {p1, v5, v1, p2}, Lbe2;->E(Landroid/os/Parcel;ILandroid/os/Parcelable;I)V

    .line 54
    .line 55
    .line 56
    iget-wide v1, p0, Lsr1;->q:J

    .line 57
    .line 58
    const/16 v3, 0x9

    .line 59
    .line 60
    invoke-static {p1, v3, v5}, Lbe2;->J(Landroid/os/Parcel;II)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p1, v1, v2}, Landroid/os/Parcel;->writeLong(J)V

    .line 64
    .line 65
    .line 66
    const/16 v1, 0xa

    .line 67
    .line 68
    iget-object v2, p0, Lsr1;->r:Ltu1;

    .line 69
    .line 70
    invoke-static {p1, v1, v2, p2}, Lbe2;->E(Landroid/os/Parcel;ILandroid/os/Parcelable;I)V

    .line 71
    .line 72
    .line 73
    const/16 v1, 0xb

    .line 74
    .line 75
    invoke-static {p1, v1, v5}, Lbe2;->J(Landroid/os/Parcel;II)V

    .line 76
    .line 77
    .line 78
    iget-wide v1, p0, Lsr1;->s:J

    .line 79
    .line 80
    invoke-virtual {p1, v1, v2}, Landroid/os/Parcel;->writeLong(J)V

    .line 81
    .line 82
    .line 83
    const/16 v1, 0xc

    .line 84
    .line 85
    iget-object p0, p0, Lsr1;->t:Ltu1;

    .line 86
    .line 87
    invoke-static {p1, v1, p0, p2}, Lbe2;->E(Landroid/os/Parcel;ILandroid/os/Parcelable;I)V

    .line 88
    .line 89
    .line 90
    invoke-static {p1, v0}, Lbe2;->N(Landroid/os/Parcel;I)V

    .line 91
    .line 92
    .line 93
    return-void
.end method
