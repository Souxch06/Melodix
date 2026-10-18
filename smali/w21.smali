.class public final synthetic Lw21;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lzh0;


# instance fields
.field public final synthetic j:Lk6;


# direct methods
.method public synthetic constructor <init>(Lk6;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lw21;->j:Lk6;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final c(Lci0;Lvh0;)V
    .locals 0

    .line 1
    sget-object p1, Lvh0;->ON_START:Lvh0;

    .line 2
    .line 3
    iget-object p0, p0, Lw21;->j:Lk6;

    .line 4
    .line 5
    if-ne p2, p1, :cond_0

    .line 6
    .line 7
    const/4 p1, 0x1

    .line 8
    iput-boolean p1, p0, Lk6;->e:Z

    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    sget-object p1, Lvh0;->ON_STOP:Lvh0;

    .line 12
    .line 13
    if-ne p2, p1, :cond_1

    .line 14
    .line 15
    const/4 p1, 0x0

    .line 16
    iput-boolean p1, p0, Lk6;->e:Z

    .line 17
    .line 18
    :cond_1
    return-void
.end method
