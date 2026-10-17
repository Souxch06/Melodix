.class public final Lqn1;
.super Lun1;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# static fields
.field public static final b:Lqn1;


# instance fields
.field public final a:Ljava/util/concurrent/atomic/AtomicReference;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lqn1;

    .line 2
    .line 3
    sget-object v1, Lvn1;->a:Lvn1;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lqn1;-><init>(Lun1;)V

    .line 6
    .line 7
    .line 8
    sput-object v0, Lqn1;->b:Lqn1;

    .line 9
    .line 10
    return-void
.end method

.method public constructor <init>(Lun1;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    .line 5
    .line 6
    invoke-direct {v0, p1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lqn1;->a:Ljava/util/concurrent/atomic/AtomicReference;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;Ljava/util/logging/Level;Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lqn1;->a:Ljava/util/concurrent/atomic/AtomicReference;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lun1;

    .line 8
    .line 9
    invoke-virtual {p0, p1, p2, p3}, Lun1;->a(Ljava/lang/String;Ljava/util/logging/Level;Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final b()Lzn1;
    .locals 0

    .line 1
    iget-object p0, p0, Lqn1;->a:Ljava/util/concurrent/atomic/AtomicReference;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lun1;

    .line 8
    .line 9
    invoke-virtual {p0}, Lun1;->b()Lzn1;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public final c()Lk42;
    .locals 0

    .line 1
    iget-object p0, p0, Lqn1;->a:Ljava/util/concurrent/atomic/AtomicReference;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lun1;

    .line 8
    .line 9
    invoke-virtual {p0}, Lun1;->c()Lk42;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method
