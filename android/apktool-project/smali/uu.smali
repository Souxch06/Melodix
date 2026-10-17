.class public final Luu;
.super Lkq;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public m:Lfz0;

.field public synthetic n:Ljava/lang/Object;

.field public final synthetic o:Lwu;

.field public p:I


# direct methods
.method public constructor <init>(Lwu;Lkq;)V
    .locals 0

    .line 1
    iput-object p1, p0, Luu;->o:Lwu;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Lkq;-><init>(Liq;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final m(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 1
    iput-object p1, p0, Luu;->n:Ljava/lang/Object;

    .line 2
    .line 3
    iget p1, p0, Luu;->p:I

    .line 4
    .line 5
    const/high16 v0, -0x80000000

    .line 6
    .line 7
    or-int/2addr p1, v0

    .line 8
    iput p1, p0, Luu;->p:I

    .line 9
    .line 10
    const/4 p1, 0x0

    .line 11
    const/4 v0, 0x0

    .line 12
    iget-object v1, p0, Luu;->o:Lwu;

    .line 13
    .line 14
    invoke-virtual {v1, p1, v0, p0}, Lwu;->i(Ljava/lang/Object;ZLkq;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method
