.class public final Lck;
.super Ljg0;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lbk;


# instance fields
.field public final n:Lng0;


# direct methods
.method public constructor <init>(Lng0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lek0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lck;->n:Lng0;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final b(Ljava/lang/Throwable;)Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljg0;->k()Lng0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Lng0;->s(Ljava/lang/Throwable;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public final l()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public final m(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lck;->n:Lng0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljg0;->k()Lng0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p1, p0}, Lng0;->o(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    return-void
.end method
