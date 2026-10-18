.class public final Lbf1;
.super Luq;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# static fields
.field public static final l:Lbf1;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lbf1;

    .line 2
    .line 3
    invoke-direct {v0}, Luq;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lbf1;->l:Lbf1;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final r(Lsq;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    sget-object p0, Lyv;->m:Lyv;

    .line 2
    .line 3
    const/4 p1, 0x1

    .line 4
    iget-object p0, p0, Lyv;->l:Lyq;

    .line 5
    .line 6
    invoke-virtual {p0, p2, p1}, Lyq;->g(Ljava/lang/Runnable;Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final t(I)Luq;
    .locals 1

    .line 1
    invoke-static {p1}, Lk42;->a(I)V

    .line 2
    .line 3
    .line 4
    sget v0, Lrb1;->d:I

    .line 5
    .line 6
    if-lt p1, v0, :cond_0

    .line 7
    .line 8
    return-object p0

    .line 9
    :cond_0
    invoke-super {p0, p1}, Luq;->t(I)Luq;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public final toString()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "Dispatchers.IO"

    .line 2
    .line 3
    return-object p0
.end method
